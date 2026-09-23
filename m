Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE9A420E89
	for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2026 17:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790185778; cv=none; b=S52t1bq5YcpElTeW2lR1HeWQMhdD/ikWS//AMg/e1zA5IIKR328mXtlKBxK2xMLceJxAwnTsdyNxVGSZl3T40dhE7HkMsIGRXyDgVLpU1nSB/TNq438r2YAetZ98/XQEv6O/aG4M4CD6puX+Fuv3FHDe9Y6bYIXQxaBd4FypJbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790185778; c=relaxed/simple;
	bh=b0qrLZrXHcjxaMdguIqby07pC/TpQhegHwKy5tJHNHA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=fiuZlpLpVPjfGNOUgaHa9EuYPg4VnVNnk0b1GWVnOlWivOnIClYziF6HAmrsX2wlZS6492Tnv6RVCKJzQG4xz4qNha6rvk9vawJuZruT6K6ym9yhu1LYgIjeop1CHgSejv6jsQm+uSII7G8qjWbWRnoQTWAKXWVGiZuNmsxwNK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RWaan63S; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RWaan63S"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4d04d740cso659952a12.0
        for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2026 10:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790185775; x=1790790575; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=b0qrLZrXHcjxaMdguIqby07pC/TpQhegHwKy5tJHNHA=;
        b=RWaan63S3XBEf34onYxukqlDJ74B6rL/lbo4PsN/sDumTwMMfjCMq4PyeVSdY8PiN+
         OGeiCDbzWk8O/y0HJW2nF/AuxjwrCc2nrC1Ig03c2FMQi0BTq3RniXwuzREoFY1+mHlR
         CSlVKYeZwVo/zPSbfLBLgf8ubdiURu7aJTqVsVDHjdMLWqBCWmDtu2CrMBnQjjrmMM9f
         tc5TFAscc65Ndsgcq9k53aRY869HVBGU4g76GyOIxt86Dmx6Jk9l59oNNwUvb4gwZjN9
         Sy9QLGhWMyK6IkEgacSPsoRHjV0WEkg091LffqoLBRodv0z+y2K9g0AjvWh4g/i6jIeU
         tXzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790185775; x=1790790575;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b0qrLZrXHcjxaMdguIqby07pC/TpQhegHwKy5tJHNHA=;
        b=OkLRGm9w8cmW/3q2oGLB34ry9jpDXH1pMWgxw1DCmi+VotVTWSV9S07uS7FJSdv6SZ
         fMtfyF2+tnLcuubG83D2yQMJfPi8WY027DAaxyeq9HYQisC6mpyPNTPnD257O/DOZiqC
         BeqrgNZ+oLnQWgPmjwJwBYHLYvbt+EtAdM1iohAS/RfL1qViZcM1LNXlqXj6hc2ApIm6
         6zmD9AbPQMzJk1EHvql0R7WgEhMH2z/K65ieyPfcTZk+dPKaHJnndbKwJIZ78RL78qNj
         3NNmS7Cz3NRdT5WOuzQfUZO0jZarWK0Mw7DvsLRfpa+BqrZsbwIoJbxL9QYmvO1dGmIW
         Ujkw==
X-Forwarded-Encrypted: i=1; AKwUvBwAJfSSELuXXKVGMEelDWJYKdYE2hhlN1PgV8w11SDnO8Hmx02vjpxTCkLRsEN54hJKDQhynhrxngk=@vger.kernel.org
X-Gm-Message-State: AFuF++mSieUuWX+MLrvHr5A9HBkh7+Zn0t6FUii8GsPAUwF1oudTU8Vu
	5LA3bcW5TeLysFSPl0vFFH9OcD/8IuJWsk8UnOoO9ltnfbj8Pww1TfGj
X-Gm-Gg: AYBFou3RzW3U9PKfn7Ag6Oe+P1qtOBJZ8kZ5VK1PSkVNepgWbEVQ9mpGb3GtnDfiqPm
	jtlgNnK2mFky7c7h4WsFQOgxJy5p2/dnyvbgtNl9m4cyWbhGqLELIoo3cE4h99SL2jumBNCSoSc
	eLV37zaG5p8ywh8KKiT52ec22KsAl9U3p2ty35owTtloUHIX1SsGzHVhYy+XDQENx0zoaU9oxgT
	k6TqbNUwReElff4A4iKqThAWWz6/p0H8GsCDAMiCYzthm4Y0VgSP5l++NZBmAupXoJRX6rkDzwG
	fYL7EdfzSZYoD/UNOSXcJyYDsf+rVZYQLzaJb0MkM+Hc4EbLGioGUxTCQM8Px1tlF+0L/Anf3bz
	306eC/SO+mqDIvFzS6oYoUWIoBiALcDB2ADWjDlbwGXQ2m/KSvoBRaTLVasQgJWdzunPy1aQ0ti
	3bTC7eQRhxhhwjvZ+yFMEfaI+yM0Qu0DwcMytwGpaVJK/LQBkev5680LAutEERfR+qh76H44Y+B
	C4ECV/6YmPON6i8GHYv+/ycHaMxFkDUIDm9
X-Received: by 2002:a17:90b:1cc5:b0:3a0:9640:8036 with SMTP id 98e67ed59e1d1-3a09640858dmr258738a91.6.1790185775461;
        Wed, 23 Sep 2026 10:49:35 -0700 (PDT)
Received: from localhost ([13.93.150.60])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a081274d7fsm2065754a91.2.2026.09.23.10.49.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 10:49:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Sep 2026 17:49:33 +0000
Message-Id: <DLMVW6Z8IU9P.31OHF60Q6YCWP@gmail.com>
Subject: Re: [PATCH net-next v4 2/2] selftests: net: test untracked NA
 recovery of FAILED neighbors
From: "Lawrence Lee" <lfqlee314@gmail.com>
To: "Ido Schimmel" <idosch@nvidia.com>
Cc: "David Ahern" <dsahern@kernel.org>, "David S. Miller"
 <davem@davemloft.net>, "Eric Dumazet" <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Simon
 Horman" <horms@kernel.org>, "Randy Dunlap" <rdunlap@infradead.org>,
 <netdev@vger.kernel.org>, "Arun Ajith S" <aajith@arista.com>, "Roopa
 Prabhu" <roopa@nvidia.com>, "Jaehee Park" <jhpark1013@gmail.com>, "Jonathan
 Corbet" <corbet@lwn.net>, "Shuah Khan" <skhan@linuxfoundation.org>, "Shuah
 Khan" <shuah@kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.17.0
References: <cover.1790127207.git.lfqlee314@gmail.com>
 <ce40008682ed26ab039168a5fcb515eff8d30c3a.1790127207.git.lfqlee314@gmail.com> <20260923083633.GA2626135@shredder>
In-Reply-To: <20260923083633.GA2626135@shredder>

On Wed Sep 23, 2026 at 8:36 AM UTC, Ido Schimmel wrote:
> You shouldn't have added a Fixes tag. Backporting this patch to older
> kernels will make the test fail. Wait for feedback from Jakub / Paolo
> before posting v5. They might agree to strip it before applying.
>

That's my mistake, I added it in response to Sashiko review feedback on=20
v3 but thought it was just for documentation purposes, I didn't realize=20
the tag would cause it to get backported since I only submitted to=20
net-next. Sorry about that, will wait to hear from Jakub/Paolo before=20
sending any new versions.
