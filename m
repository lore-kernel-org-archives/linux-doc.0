Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAEE14C043C
	for <linux-doc@vger.kernel.org>; Thu, 24 Sep 2026 20:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790282547; cv=none; b=qnDj4bNwXiV9U/AKQDrO+li6StFJMiVY7gf2MVaURfUBr5ViyqJgDaSNOMGMde/6z9eSJ1M81xdKv/IJsnfczPXiqaY08FY251J19TbdF7Zgu7Z3rIt19zFeCxJZYaLjLwjsxH+N7Ghh8DfnQfeg8x6+Pncd8GbOxPWkPVjit+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790282547; c=relaxed/simple;
	bh=yycJFSYTZVj0gU7IaV21CimwXI7Tl1p4NN6XNWr9W4Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PQoZep8+StDyw3IVjW6K5KMgPZ574PTqxNBNSPj5DHsHmF7LdVtCK9E7U1HmifPKumjBdm2tSyEjJGz4cf/2teEgqFBlooVQV1PX4Dsc0NnSPoxi+JU5ei2JmASEtxTlj/kICbfE9Z/Px4GrJ2HTJlqOcvQsNcwDrfFstiJlAL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EdKoYGdW; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EdKoYGdW"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-3411e0ace19so82719eec.3
        for <linux-doc@vger.kernel.org>; Thu, 24 Sep 2026 13:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790282536; x=1790887336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xP3zE8Hiy2WoP8V41wtxeqAxtA7sOMVqtNcQJynNG/Q=;
        b=EdKoYGdW0MWc6FZhcaClpdDeN3U0gif9xetFuUwkCAiuiTc0e5Wn+m5RS3mvXrjgtG
         uSQe9OGiw9kcZ3yMb+z6Cffh0KjU8NO8N5e/n/Uq/wpTJLrix3lJ4YHsNyea7+D5ta7C
         VB16rjNARAraSyPJflfytMe1972QvOCtF9AejwSOtm37rUxfZ6+hBSK75IDgYDp9xZbM
         Tx7dtcRJ3FvTYVvx1CSeY7Pz+LUSA3Ry5LBjnxsvfsXdfmzP8Ly0ioEyVHOV+CextWs/
         1t8wJHkrVbaKFB5U14+cX+7H69MHYwiT3w6naTgC2mOQrNXuyw0O8XSIi+8vzeuQfW69
         wATQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790282536; x=1790887336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xP3zE8Hiy2WoP8V41wtxeqAxtA7sOMVqtNcQJynNG/Q=;
        b=yVTFktgdOsdBdZb7FqzecjMeTmj0ENiA5vOxfAGVe1/OcgPBNJaRagt1ZlNg2HPA+F
         W9KNuInYytzi0qCHNhNaZQIhHyU1rOhvDaom1RBpqC6l1ry1unfcC3Y/1KqRbnP3uuvz
         y59ey2rzKkAgwe61a8Ldz+w25GsgQCuBB63A8Tl/B3VisYT18U3KClrCUz8ImsHWL1jw
         jp5IV98LAP4GB65ZeQ84sZWNqL1d4Ooo/L1Wesbawknla4Urdo/V+WaypvAL7kQYlMB3
         Q5wu09jU0sC4Ie0hwVd0edzAOSrntlN0vW+sWIWGLOKhYaVKU1/RzBttngVR8DPVlWod
         sEGA==
X-Forwarded-Encrypted: i=1; AKwUvBz6C918U8S2JIQWD2WxuM4bvJhEeCC8NMYbgUw+vfytI1A1qNMbfkedgFd+VnvHEw8oJeeIZdGycI8=@vger.kernel.org
X-Gm-Message-State: AFuF++k/RB2KKu1nJPXfDCYdh+uo5BqNENVV8ZOcQvDly6I+z+FAYm2S
	CoNDSbQu9ncBPLCi1KeTN6aXn4DYQ5K1dd9V1M//lsbR3NutaWedrioN
X-Gm-Gg: AYBFou17Jik7A/g6O8fjnK9kLJzZPwpUyetWr/U0oxTwptembOdXm6wAtfNQv59W9b6
	iULRATic/B5bRqYf0FfmPW9dTNd59htg+XuDZDa+P+XnUTJwjN94t/1neHefwqfH9HTBNlqKJzm
	bwou8KgJBm1Z4t+7zWNsygxHpCA2ZE4jWOI6qre0x9PNOAxirFEzC3y6gtelyICe9rgpb0Dfb4N
	UPkVw8LuRvvcNercGdcAc8AdRw8JnK9z9KYq7UviGYEb7tKeKa6tPY22UIqzgx09IT67Icy9qKX
	XI9Qb4lIXz2H/LrxZK+8z6vk+HcNaTjF6t5VZhyo3uBPoUqyzYSXGaRKZ8hh6re6E1W0DmSaEfE
	eY1FhC2KbladaTlErlyRmLl7XsqNitFddv2Rx2Vic69OiU9HAmE+9BswpfM/DfgTnnyv/wP/5Z/
	5dRw2y7mrQpm2Q65sqUMMc0ocV0NO99MaxxN0opY+nWn8abxfELO+BTSLrVECTC4OIWsSYuxhM9
	lh7Vlztr7QauiXoR5ywrvnXkZVKgab7/n/DUsQMqg==
X-Received: by 2002:a05:7301:312:b0:339:7515:dc86 with SMTP id 5a478bee46e88-3400566bc9cmr2762170eec.37.1790282536083;
        Thu, 24 Sep 2026 13:42:16 -0700 (PDT)
Received: from pop-os.scu.edu ([129.210.115.107])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34141d2fe4bsm1073470eec.4.2026.09.24.13.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 13:42:15 -0700 (PDT)
From: Cong Wang <xiyou.wangcong@gmail.com>
To: Kees Cook <kees@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Will Drewry <wad@chromium.org>,
	Christian Brauner <brauner@kernel.org>,
	Andy Lutomirski <luto@amacapital.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 3/3] docs/seccomp: describe the SECCOMP_FILTER_FLAG_RESTART_BEFORE_RECV flag
Date: Thu, 24 Sep 2026 13:42:09 -0700
Message-ID: <20260924204209.477694-4-xiyou.wangcong@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924204209.477694-1-xiyou.wangcong@gmail.com>
References: <20260924204209.477694-1-xiyou.wangcong@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Cong Wang <cwang@multikernel.io>

Document the new opt-in flag, its listener requirement and interaction
with WAIT_KILLABLE_RECV. Explain syscall re-evaluation and the
cancellation, timeout, fairness and argument-mutation tradeoffs.

Assisted-by: Codex:gpt-6
Signed-off-by: Cong Wang <cwang@multikernel.io>
---
 .../userspace-api/seccomp_filter.rst          | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/userspace-api/seccomp_filter.rst b/Documentation/userspace-api/seccomp_filter.rst
index cff0fa7f3175..b6875ce54fe2 100644
--- a/Documentation/userspace-api/seccomp_filter.rst
+++ b/Documentation/userspace-api/seccomp_filter.rst
@@ -281,6 +281,35 @@ process will ignore non-fatal signals until the response is sent. Signals that
 are sent prior to the notification being received by userspace are handled
 normally.
 
+``SECCOMP_FILTER_FLAG_RESTART_BEFORE_RECV`` can be set at filter installation
+to restart a syscall interrupted while its notification is still awaiting
+receipt, even if the signal handler was installed without ``SA_RESTART``.
+The handler runs, and if it returns normally, syscall entry and the seccomp
+filter are evaluated again. The abandoned notification is removed; a new
+notification is queued if the filter again returns ``SECCOMP_RET_USER_NOTIF``.
+This avoids returning ``EINTR`` before the syscall has executed, including
+for calls such as ``close`` where callers do not retry on ``EINTR``.
+A failed notification receive that resets the notification to its initial
+state is also eligible for restart.
+
+The flag requires ``SECCOMP_FILTER_FLAG_NEW_LISTENER`` and can be used with
+or without ``SECCOMP_FILTER_FLAG_WAIT_KILLABLE_RECV``. Using both flags allows
+handlers to run before receipt and defers non-fatal signals during supervisor
+processing after receipt. Without ``SECCOMP_FILTER_FLAG_WAIT_KILLABLE_RECV``,
+interruptions after receipt retain the existing ``SA_RESTART`` behavior.
+Fatal signals still terminate the notifying process. Neither flag changes
+supervisor-supplied errors or the native syscall's restart behavior after a
+``SECCOMP_USER_NOTIF_FLAG_CONTINUE`` response.
+
+Unconditional restart before receipt is opt-in: a normally returning signal
+handler can no longer cancel that wait with ``EINTR``. Native syscall timeout
+and signal-mask handling have not started during mediation. Repeated signals
+can therefore extend elapsed time and, as restarted notifications join the
+tail of the queue, delay receipt indefinitely. Handlers can also modify memory
+referenced by syscall arguments, so the restarted call must be authorized
+afresh; this flag does not provide an argument snapshot or prevent TOCTOU.
+Existing behavior is unchanged when the flag is absent.
+
 It is worth noting that ``struct seccomp_data`` contains the values of register
 arguments to the syscall, but does not contain pointers to memory. The task's
 memory is accessible to suitably privileged traces via ``ptrace()`` or
-- 
2.43.0

