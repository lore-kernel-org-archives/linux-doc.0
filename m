Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5A53115A5
	for <linux-doc@vger.kernel.org>; Tue,  2 Dec 2025 11:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764676343; cv=none; b=OCxRJ32pQRqCheY6xG+G3LxM9ST+OmPBnZrpRxiLaOB+cEcemaOk3TVM1Z7sP5s5O8CsWciztdpx1p/Nb2cZnk0pZh4lIoYojjRe3z4gTdSI62dhjpPcNf2eM98OD1SCkBQgpmPtoPPVjMRKHg2cRb63eTIlQmnE5GxHzE75Vww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764676343; c=relaxed/simple;
	bh=218J8Ai33ogJQYM35mkLVEHPgWBEcnfqrZ9vAzahBCk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jckGRajLtJ6dzU597YmVAJt6E/ij02XQQ9UD2+nr//6Mk5d2R80ZHspcUkldqso81aMmxpoIfygOfvwV4IZaEpgMqSc+sk6p9kqon7yASZVxOr6h64V3XmIF5Y2a3vRLtLqIXg8AKU7j9RisP7knFON4sSJ49Pn5rZORL+xRm2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=tRBbLNCh; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="tRBbLNCh"
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 398684012B
	for <linux-doc@vger.kernel.org>; Tue,  2 Dec 2025 11:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1764676335;
	bh=aLk77fq6anWET1IsmWMe+oGxx8Dt6nc1++cRTQJu+8I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=tRBbLNChWeqeUfJ8nTpSwiQf98a+buDojW8va/cOq3DiO9HMNveSH0axObF0wNcio
	 v68ayJUQTIbhTzUPIwseya+lDm2JNw4aiVeK2g34/s+3DB+Os4GRQeamX5jZPHya9f
	 fbiVmR8Mn9U79C+1izPfJAM3aKx8ngOOP8aDt7xb1NqyL3I65hPKhQVnKjYMQ9LnGy
	 oiVxjoG+SQAfpBl9/VFIOhbOGxPR5RgmumFILhYmBdUKu5HLFmSsDNrUoFgo4/94XW
	 FCUN+cZamkZYJl5cnf5JcB55OEkPGxQKArXLYkAStHKmvMCRUXVpAbRL6FoYFwk+Jh
	 qeqRhrAbAZymUr0xbTpxQv/m7YO9fWGCdA2CrCDV7946mNN8FlMjuKn2eIOTUuWFMZ
	 dqXGzr7lhLwtyr3i8bWuzX4qRslL+PQj7kuR6Mjs2l4vnDA4BIAwTtcdHE2wVx0+YT
	 2IXXp4Wk3q5FG9y/FzSbqZvMK8P4R6gKTxdkh1Rrz3P+1dF5oUMJA6D034C/mvYw81
	 hRS2qEy3ZEKKsKumh9O3JHIt9rSWVx1NlUNc8wpQW23UQLL6MZ4kMDUqGVrma0wJaX
	 NPESXkDB+TPET7JpKFAvxmL4nkZs390Twg8mJejo0XU/mSPAOoFvNjoXyMs4YjuygS
	 /0rXoqg9uo92NTCTB5mCnOuk=
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-6416581521eso5971710a12.2
        for <linux-doc@vger.kernel.org>; Tue, 02 Dec 2025 03:52:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764676333; x=1765281133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aLk77fq6anWET1IsmWMe+oGxx8Dt6nc1++cRTQJu+8I=;
        b=aVdBLgHW6KdNYFB6tz5PFqtH8rUfrshaY3YiBn7WMqWjN6cdjRmozPiZNeRK0Rv6ZG
         Cp8pcsYkcDUZFwoDbV4+Y43CVXc69cPem0OwIjTkJRrCfTW2Kq4LvOtez3Hkt9Sgax2+
         MdhEWG9aTc254yXCxW+hT5NgA45r06YBFQcwzwji2euAafgnZGcJxaVnu5wdIxpdw8mE
         vxyl924DOW47z0DortmoLoZRmUcfWf3ZYPKmGbxrFYoCEw8eEGZFb3xSoDNWw993X0o3
         AcbbD2LEaCjijaNbq4ZASm8LAGgLTWjE4E3JGUs0fIqfDRhLenmNR1yRujNnUNl5fuZn
         +irw==
X-Gm-Message-State: AOJu0Yxm0QKQWkFqyXFTsiZAFUh7NbDGO3YpreOHDk1o5lY5m+Aj7C6P
	RqPfsypRqTixQH+055erQdlE4azF43CyEUdsbBqx3RiyQluTltfFJLXOOBg0KPjA6ZlD3hme0Ax
	AoUyzX86y4WXmOYuSOZjVu2WsUkPZPku5DIH5ELEXruv+exT1uHfRmwxPszDRG28C/+HOO01foH
	ht9nJrO7wq3U10
X-Gm-Gg: ASbGncsx936gVbUTfj/57RKP1TYJE3uepJSm2j3q6PdirO6knQxsrGJs5TXEQ3uYc7y
	a6RTWiMyCCtqGaJdRXMsmUGstuNB+OXvowbvRFEX6cXX2IevoSPzM89f835CbD0EuUzuWe/5h8z
	q7PfsFLIp4fW76/Ck8zseZUs4h75OO/K1fa9dBjo8aiYlqNjim869twoYeJb/XielvtnkXNskQs
	n4T8V3aptVAtq018juyfshdNEMol11CuyEEAv5QFWieliiXJwwx+Tgu5OdXlb8UjeGk3cdfdvOt
	2yumXNfKi/Kc5d6Ki15UNOD/xDzg9tqYdcSaty7tVWbnENTwHe3uXJbDVGES3uqCtS+tROL+JXb
	KCXZBwXTMxn8WIK4/BjlT3fMuw3VFyeQqhfdJkqUBMKOcRdv1NCHBJ/CyZzidYoA4e8pULWF7ts
	FQtcKKynDZ6FwMB5T1ZGOUd+U=
X-Received: by 2002:a05:6402:13cb:b0:640:c454:e8 with SMTP id 4fb4d7f45d1cf-645eb2b7f7emr28796258a12.30.1764676333177;
        Tue, 02 Dec 2025 03:52:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFZ9expo3B5tPaNh1xUnvEAvjM2nvZtx4TmKzoeDj2gQnT861O1Mrm/FdJgtOAf3NtE994gSg==
X-Received: by 2002:a05:6402:13cb:b0:640:c454:e8 with SMTP id 4fb4d7f45d1cf-645eb2b7f7emr28796244a12.30.1764676332812;
        Tue, 02 Dec 2025 03:52:12 -0800 (PST)
Received: from amikhalitsyn.lan (p200300cf5702200011ee99ed0f378a51.dip0.t-ipconnect.de. [2003:cf:5702:2000:11ee:99ed:f37:8a51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647510519efsm15206765a12.29.2025.12.02.03.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 03:52:12 -0800 (PST)
From: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
To: kees@kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Aleksa Sarai <cyphar@cyphar.com>,
	Tycho Andersen <tycho@tycho.pizza>,
	Andrei Vagin <avagin@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	=?UTF-8?q?St=C3=A9phane=20Graber?= <stgraber@stgraber.org>,
	Tycho Andersen <tycho@kernel.org>,
	Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
Subject: [PATCH v2 1/6] seccomp: remove unused argument from seccomp_do_user_notification
Date: Tue,  2 Dec 2025 12:51:53 +0100
Message-ID: <20251202115200.110646-2-aleksandr.mikhalitsyn@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251202115200.110646-1-aleksandr.mikhalitsyn@canonical.com>
References: <20251202115200.110646-1-aleksandr.mikhalitsyn@canonical.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove unused this_syscall argument from seccomp_do_user_notification()
and add kdoc for it.

Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Kees Cook <kees@kernel.org>
Cc: Andy Lutomirski <luto@amacapital.net>
Cc: Will Drewry <wad@chromium.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <shuah@kernel.org>
Cc: Aleksa Sarai <cyphar@cyphar.com>
Cc: Tycho Andersen <tycho@tycho.pizza>
Cc: Andrei Vagin <avagin@gmail.com>
Cc: Christian Brauner <brauner@kernel.org>
Cc: Stéphane Graber <stgraber@stgraber.org>
Reviewed-by: Tycho Andersen (AMD) <tycho@kernel.org>
Signed-off-by: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
---
 kernel/seccomp.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/kernel/seccomp.c b/kernel/seccomp.c
index 3bbfba30a777..f944ea5a2716 100644
--- a/kernel/seccomp.c
+++ b/kernel/seccomp.c
@@ -1142,8 +1142,18 @@ static bool should_sleep_killable(struct seccomp_filter *match,
 	return match->wait_killable_recv && n->state >= SECCOMP_NOTIFY_SENT;
 }
 
-static int seccomp_do_user_notification(int this_syscall,
-					struct seccomp_filter *match,
+/**
+ * seccomp_do_user_notification - sends seccomp notification to the userspace
+ * listener and waits for a reply.
+ * @match: seccomp filter we are notifying
+ * @sd: seccomp data (syscall_nr, args, etc) to be passed to the userspace listener
+ *
+ * Returns
+ *   - -1 on success if userspace provided a reply for the syscall,
+ *   - -1 on interrupted wait,
+ *   - 0  on success if userspace requested to continue the syscall
+ */
+static int seccomp_do_user_notification(struct seccomp_filter *match,
 					const struct seccomp_data *sd)
 {
 	int err;
@@ -1317,7 +1327,7 @@ static int __seccomp_filter(int this_syscall, const bool recheck_after_trace)
 		return 0;
 
 	case SECCOMP_RET_USER_NOTIF:
-		if (seccomp_do_user_notification(this_syscall, match, &sd))
+		if (seccomp_do_user_notification(match, &sd))
 			goto skip;
 
 		return 0;
-- 
2.43.0

