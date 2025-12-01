Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A181306B24
	for <linux-doc@vger.kernel.org>; Mon,  1 Dec 2025 12:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764591861; cv=none; b=LjMO5lqNjyHk/Y+X5ZXVkJN+plu7V9eMqkCSTrdjVVjICFxIO2pAlkpmVEZbcYUtBfuZLLc3KnpsgH6JFU+jsF+9RPENCkYKX7Pc+TbTNPrEQ1reshMpXTxoj2KuIxJjLODWveBDRAci9mRL/rTP1J93iEUBYKlHk/wv+HVvyXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764591861; c=relaxed/simple;
	bh=/AVZ1KTl67UPm9oJo5daI+HtXeVjXE0ygjNScp5tOsM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=otOmGujDjC6cQhZzHJj3BDACcT/LKL4Ai8kjENPbI5qiGhrS4OsFBV3OQe7UBw/7KBTSlKOVG14Y/mEYua2GpRKftYZlxF0Tb6PJbFeC2gBCuG7CgMYOjUCi2SIpzE9W8ipMsDDQK9XJWfZC6Aj9ImNRwM66aCEtWo2EYbMMX1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=D/dae50V; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="D/dae50V"
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 96DA33F180
	for <linux-doc@vger.kernel.org>; Mon,  1 Dec 2025 12:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1764591856;
	bh=7pZ0iEmlRC+UmoLWz0HVLhgvBs5Lg5e5yJ2fSZ1YjvY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=D/dae50VQO9wiRgn+1/EN4+b8E8U/UCwyXll6H/05MGOAPotteLdQFU+1m4Ww1FG9
	 fHyefQ97ZiER9ApArflJ9Y0e+AEDg/hbq7+uVmr3kMjNDp4T2uqUx9gdZOK89Dio/Z
	 xsOdCv+d0LfGj1+evnaJARGm0DDrF5iw7lWNu/UrjvliofvqJ/aAF4HhpdxYmDe8pp
	 T6Scv/zzWIr2VrOtHOqviiR7LX/WTpvmJopWbetqQE+oELLR9OoPPPZGCeCQyyVtQ+
	 JQBOfefvu54nJphaYYVi2U8znUjWDsjafRlhy8QPm+6VIsSHULClJEJ9PYLVLiF1/p
	 76LJbGzWbMRWRJNKnRHPA2Tf6lybDCJSVjtViDBx6axNYYH1Fr7K/5hwznjpGmMLLn
	 gn01ncIoiC4QNitRSQpuA74E/Ui5SFu+mTIM+lX4d3R8g/UyhaQ0o+sD8Glf/j81cW
	 gZmL/UVkwOpr8hUUgiJOouCFEAUYc2kUDGA70hyPgUTQzr3kG98BVSqGZizxkDwLl7
	 hjeIxP0rK5NOpoTPhfuSzOpQE7uXMP5NEeLk9LeOEPXTRU8SJI7x6F4DMyxmmKuHkZ
	 yXdKM0JCwdEueFcb6uHd+VNe24uO8O1nIuFOmVl0EUtp7ciwmxR+/IQNs+0CMn8UNO
	 8hHJ4FQD6UyG2GjQlx8gXWpk=
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-b736eca894fso330889266b.1
        for <linux-doc@vger.kernel.org>; Mon, 01 Dec 2025 04:24:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764591856; x=1765196656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7pZ0iEmlRC+UmoLWz0HVLhgvBs5Lg5e5yJ2fSZ1YjvY=;
        b=EfErCIKhlbYhxUi++CimNu2F7ckGuq7umHIbfY7LAvMfjt5vv8hKuu5DTT5tQBn/Gb
         69rTpp8oCXuHBaPWM10B8ZSvXXaB9uHItsxqdKseAuHqh8Ack0eI/w4FDFaxBU65CoWd
         c/uEwtIYbBgVoGCb56hCf9CBOvVfTf429e3uPYfJKyMTL2V5Q+LQUacAMvs5DmLvFbo1
         ZSYD1O9okvdHUReQlM5GZdUZp2omWKvMT1MR4AKOBgk1sv6aP/w0felYDWO9z+EJ9KL7
         6tc+BIRpIUWczipLUnNDNON0ioG7C0sXY/ebb5mwRw0COxR37TcSgKWlDNnfQ6pDNmw8
         3Fww==
X-Gm-Message-State: AOJu0YxS7K2yF2HvBzvJovhr0Yf6IRgOI138UPn5ZtHYKghCNwT3rvS5
	7BsJNqAXeOpUfYeyBfXs5yU791XiUIjIFuFUlgstP1F24EOfx9iOtI3fGWGa+XdhvRtuz2CrpeX
	E3FyLNf1hu4jfUHep8nRv8VfwYnrYK2V/5aRlw1uqkk3/1n4elbWp7sPgXKvVgYV0dZhmb7fD3D
	a/uA==
X-Gm-Gg: ASbGnct1txq58N/LZssF08KMNZDN9DBGtpMZUQX5jQ7Euy20mm4vZKqN4zyQGLUZVj2
	DrG//9gx03f1EgxYgFLQOrF8tvAqf8dcKZu/xqFHsFoRyU0K+CaqfIz2V304Fdt+PD89y6CxU5Q
	vRkihtw4EKf3Ihd/lUX97ydM51xnf8tIyBkEmLGDNL21kEu5/YMwmfMYbkUxnoQJNXampHC8Veu
	Qzqx1cMfujAV5EDvwrhgTlvd8ROnsnrhYv6PSZb8dLfk1Ju0HSTMKkR4bXWdGtZLZiUzXfAXvU8
	kzSfawMku3QOVkXTcL5gikLxBxbSlaAUv1HGxEgux6vplTMytmZesGyIvhLkU8/svweDNtyWXql
	BYqzqWRAxqu9lwJv0n8vxXB0AQ6FlAK0Nyy2wtrUKmrGl5kf6+yRdVFcmIzXg+uTUd6xnPHnXca
	op5Xr5l553O2wXwTcrJbXeS8X1
X-Received: by 2002:a17:907:da4:b0:b73:3ced:2f66 with SMTP id a640c23a62f3a-b767159eea3mr3956229866b.14.1764591856092;
        Mon, 01 Dec 2025 04:24:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFIZW7AV81jLeOVeNdSzCklwOYrFNBodBijapwm/R3JQVkCZsHyMjBHE1GdiGc2mvTdOFtc5A==
X-Received: by 2002:a17:907:da4:b0:b73:3ced:2f66 with SMTP id a640c23a62f3a-b767159eea3mr3956227266b.14.1764591855671;
        Mon, 01 Dec 2025 04:24:15 -0800 (PST)
Received: from amikhalitsyn.lan (p200300cf5749de007c66abd95f8bdeba.dip0.t-ipconnect.de. [2003:cf:5749:de00:7c66:abd9:5f8b:deba])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64750a6ea36sm12307884a12.2.2025.12.01.04.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 04:24:15 -0800 (PST)
From: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
To: kees@kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Tycho Andersen <tycho@tycho.pizza>,
	Andrei Vagin <avagin@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	=?UTF-8?q?St=C3=A9phane=20Graber?= <stgraber@stgraber.org>,
	Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
Subject: [PATCH v1 1/6] seccomp: remove unused argument from seccomp_do_user_notification
Date: Mon,  1 Dec 2025 13:23:58 +0100
Message-ID: <20251201122406.105045-2-aleksandr.mikhalitsyn@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251201122406.105045-1-aleksandr.mikhalitsyn@canonical.com>
References: <20251201122406.105045-1-aleksandr.mikhalitsyn@canonical.com>
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
Cc: Tycho Andersen <tycho@tycho.pizza>
Cc: Andrei Vagin <avagin@gmail.com>
Cc: Christian Brauner <brauner@kernel.org>
Cc: Stéphane Graber <stgraber@stgraber.org>
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

