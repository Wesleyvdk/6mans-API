### 6Mans API Documentation

The **6Mans API** is a RESTful service designed to support the **6mans and scrim finder** system for Rocket League. It allows for **rank-based matchmaking**, **scrim scheduling**, **match tracking**, and the uploading of **Rocket League replay files** for automatic stat parsing. This API is used by both the **Discord bot** and the **website** to facilitate seamless interactions for the users.

The API uses standard HTTP verbs such as `GET`, `POST`, `PATCH`, and `DELETE`. The requests and responses are in JSON format unless otherwise specified.

---

## **Authentication**

The API does not directly handle user authentication. Instead, authentication is handled externally through the **Discord bot** and **website**, which then pass the authenticated user information (e.g., Discord ID) to the API. For testing purposes, this data can be included in the request headers or body.

**Key Considerations:**
- **Discord ID**: This is the unique identifier for users in the API.
- **Rank**: User rank (from Rocket League) is crucial for matchmaking and scrim scheduling.
- **Connected Accounts**: Users may have their **Epic Games**, **Steam**, **Xbox**, and **PlayStation** accounts connected for rank verification.

---

## **Base URL**

```http
https://api.aylanibot.app
```

---

## **Endpoints**

### **1. Users**

#### **POST /users**
This endpoint allows creating a new user and linking their Rocket League accounts.

##### **Request Body:**
```json
{
  "discord_id": "123456789012345678",
  "epic_account": "EpicUser123",
  "steam_account": "SteamUser123",
  "xbox_account": "XboxUser123",
  "playstation_account": "PSUser123",
  "rank": "Diamond 1"
}
```
##### **Response:**
```json
{
  "id": 1,
  "discord_id": "123456789012345678",
  "rank": "Diamond 1",
  "accounts": {
    "epic": "EpicUser123",
    "steam": "SteamUser123",
    "xbox": "XboxUser123",
    "playstation": "PSUser123"
  }
}
```

#### **GET /users/:id**
Retrieve information about a user by their ID or Discord ID.

##### **Example Request:**
```http
GET /users/123456789012345678
```
##### **Response:**
```json
{
  "id": 1,
  "discord_id": "123456789012345678",
  "rank": "Diamond 1",
  "total_matches": 100,
  "wins": 55,
  "losses": 45,
  "win_percentage": 55.0,
  "streak": 3,
  "connected_accounts": {
    "epic": "EpicUser123",
    "steam": "SteamUser123",
    "xbox": "XboxUser123",
    "playstation": "PSUser123"
  }
}
```

#### **PATCH /users/:id**
Update user data, such as rank or connected accounts.

##### **Request Body:**
```json
{
  "rank": "Diamond 2",
  "epic_account": "NewEpicAccount"
}
```
##### **Response:**
```json
{
  "id": 1,
  "discord_id": "123456789012345678",
  "rank": "Diamond 2",
  "connected_accounts": {
    "epic": "NewEpicAccount"
  }
}
```

#### **DELETE /users/:id**
Delete a user from the system.

##### **Example Request:**
```http
DELETE /users/123456789012345678
```
##### **Response:**
```json
{
  "message": "User deleted successfully."
}
```

---

### **2. Matches**

#### **GET /matches**
Retrieve a list of all recent matches. Supports pagination via `page` and `limit` parameters.

##### **Query Parameters:**
- `page` (optional): The page number of the results.
- `limit` (optional): The number of results per page.

##### **Example Request:**
```http
GET /matches?page=1&limit=10
```
##### **Response:**
```json
[
  {
    "id": 1,
    "team_a_score": 3,
    "team_b_score": 2,
    "team_a": [
      {
        "player_id": 1,
        "discord_id": "123456789012345678",
        "rank": "Diamond 1"
      },
      {
        "player_id": 2,
        "discord_id": "234567890123456789",
        "rank": "Diamond 2"
      }
    ],
    "team_b": [
      {
        "player_id": 3,
        "discord_id": "345678901234567890",
        "rank": "Diamond 1"
      }
    ],
    "status": "Completed",
    "created_at": "2024-09-23T12:34:56Z"
  }
]
```

#### **GET /matches/:id**
Retrieve detailed information about a specific match, including scores and participating players.

##### **Example Request:**
```http
GET /matches/1
```
##### **Response:**
```json
{
  "id": 1,
  "team_a_score": 3,
  "team_b_score": 2,
  "team_a": [
    {
      "player_id": 1,
      "goals": 2,
      "assists": 1,
      "saves": 3
    }
  ],
  "team_b": [
    {
      "player_id": 3,
      "goals": 2,
      "assists": 1,
      "saves": 1
    }
  ],
  "status": "Completed",
  "created_at": "2024-09-23T12:34:56Z"
}
```

#### **GET /matches/:id/scoreboard**
Retrieve the scoreboard for a specific match.

##### **Example Request:**
```http
GET /matches/1/scoreboard
```
##### **Response:**
```json
{
  "match_id": 1,
  "team_a_score": 3,
  "team_b_score": 2,
  "team_a_stats": [
    {
      "player_id": 1,
      "goals": 2,
      "assists": 1,
      "saves": 3
    }
  ],
  "team_b_stats": [
    {
      "player_id": 3,
      "goals": 2,
      "assists": 1,
      "saves": 1
    }
  ]
}
```

---

### **3. Queue**

The queue endpoints handle matchmaking by allowing users to join or leave the 6mans queue.

#### **POST /queues**
Add a player to the 6mans queue.

##### **Request Body:**
```json
{
  "discord_id": "123456789012345678",
  "ranked": true
}
```
##### **Response:**
```json
{
  "queue_id": 1,
  "status": "In Queue"
}
```

#### **DELETE /queues/:discord_id**
Remove a player from the queue.

##### **Example Request:**
```http
DELETE /queues/123456789012345678
```
##### **Response:**
```json
{
  "message": "Player removed from queue."
}
```

---

### **4. Scrims**

Scrim endpoints allow for organizing and scheduling scrimmages between teams.

#### **POST /scrims**
Create a scrim request between two teams.

##### **Request Body:**
```json
{
  "team_a": ["123456789012345678", "234567890123456789", "345678901234567890"],
  "team_b": ["456789012345678901", "567890123456789012", "678901234567890123"],
  "scheduled_at": "2024-09-30T18:00:00Z"
}
```
##### **Response:**
```json
{
  "scrim_id": 1,
  "status": "Scheduled"
}
```

#### **GET /scrims/:id**
Retrieve information about a scrim.

##### **Example Request:**
```http
GET /scrims/1
```
##### **Response:**
```json
{
  "id": 1,
  "team_a": ["123456789012345678", "234567890123456789", "345678901234567890"],
  "team_b": ["456789012345678901", "567890123456789012", "678901234567890123"],
  "scheduled_at": "2024-09-30T18:00:00Z",
  "status": "Scheduled"
}
```

---

### **5. Replay Upload**

These endpoints allow uploading of Rocket League replay files, which will be automatically parsed to extract match stats.

#### **POST /replays**
Upload a Rocket League replay file for a specific match. The replay is parsed, and stats are automatically stored.

##### **Request Body:**
- **multipart/form-data** with the replay file.

##### **Example Request:**
```bash
curl -X POST "https://api.[yourdomain].app/replays" \
-F "replay_file=@/path/to/replay.replay" \
-F "match_id=1"
```

##### **Response:**
```json
{
  "message": "Replay uploaded successfully.",
  "match_id": 1,
  "parsed_stats": {
    "team_a_score": 3,
    "team_b_score": 2,
    "team_a": [
      {
        "player_id": 1,
        "goals": 2,
        "assists": 1,
        "saves": 3,
        "shots": 5
      },
      {
        "player_id": 2,
        "goals": 1,
        "assists": 2,
        "saves": 2,
        "shots": 4
      }
    ],
    "team_b": [
      {
        "player_id": 3,
        "goals": 2,
        "assists": 1,
        "saves": 1,
        "shots": 4
      }
    ]
  }
}
```

---

### **6. Teams**

These endpoints allow the management of teams, which can be used for scrims and other matches.

#### **POST /teams**
Create a new team.

##### **Request Body:**
```json
{
  "team_name": "Team Rocket",
  "players": ["123456789012345678", "234567890123456789", "345678901234567890"]
}
```
##### **Response:**
```json
{
  "team_id": 1,
  "team_name": "Team Rocket",
  "players": [
    {
      "discord_id": "123456789012345678",
      "rank": "Diamond 1"
    },
    {
      "discord_id": "234567890123456789",
      "rank": "Diamond 2"
    },
    {
      "discord_id": "345678901234567890",
      "rank": "Diamond 1"
    }
  ]
}
```

#### **GET /teams/:id**
Retrieve information about a team.

##### **Example Request:**
```http
GET /teams/1
```
##### **Response:**
```json
{
  "team_id": 1,
  "team_name": "Team Rocket",
  "players": [
    {
      "discord_id": "123456789012345678",
      "rank": "Diamond 1"
    },
    {
      "discord_id": "234567890123456789",
      "rank": "Diamond 2"
    },
    {
      "discord_id": "345678901234567890",
      "rank": "Diamond 1"
    }
  ],
  "scrims": [
    {
      "scrim_id": 1,
      "status": "Scheduled",
      "scheduled_at": "2024-09-30T18:00:00Z"
    }
  ]
}
```

#### **DELETE /teams/:id**
Delete a team by its ID.

##### **Example Request:**
```http
DELETE /teams/1
```
##### **Response:**
```json
{
  "message": "Team deleted successfully."
}
```

---

### **7. Leaderboards**

The API supports a leaderboard system that ranks players based on their win/loss records, total matches played, and win streaks.

#### **GET /leaderboards**
Retrieve the top players based on performance metrics like win percentage, total wins, and streaks.

##### **Example Request:**
```http
GET /leaderboards
```
##### **Response:**
```json
[
  {
    "discord_id": "123456789012345678",
    "rank": "Diamond 1",
    "total_matches": 100,
    "wins": 75,
    "losses": 25,
    "win_percentage": 75.0,
    "streak": 10
  },
  {
    "discord_id": "234567890123456789",
    "rank": "Diamond 2",
    "total_matches": 90,
    "wins": 60,
    "losses": 30,
    "win_percentage": 66.67,
    "streak": 5
  }
]
```

---

### **Error Handling**

All API requests can return errors under various circumstances. Here are some standard responses:

#### **400 Bad Request**
The request is invalid or missing required data.

##### **Response:**
```json
{
  "error": "Bad Request",
  "message": "Missing required fields."
}
```

#### **404 Not Found**
The requested resource (e.g., user, match) does not exist.

##### **Response:**
```json
{
  "error": "Not Found",
  "message": "The requested resource was not found."
}
```

#### **500 Internal Server Error**
An unexpected error occurred on the server.

##### **Response:**
```json
{
  "error": "Internal Server Error",
  "message": "An error occurred while processing the request."
}
```

---

### **Rate Limiting**

To prevent abuse, the API enforces a rate limit of **100 requests per minute** per IP. If you exceed this limit, you'll receive a `429 Too Many Requests` response.

##### **Response:**
```json
{
  "error": "Too Many Requests",
  "message": "Rate limit exceeded. Try again later."
}
```

---

### **Security**

- All requests must be made over **HTTPS**.
- Ensure that **Discord IDs** are passed in every request to identify users.
- Use **proper validation** for rank, account linking, and scrim scheduling to ensure data integrity.

---

### **Conclusion**

The **6Mans API** is designed to provide a comprehensive backend service for the 6mans and scrim system. It allows seamless matchmaking, team management, match tracking, and integration with external services like Discord and Rocket League for account linking and rank-based matchmaking.
