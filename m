Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461DD43CE71
	for <linux-doc@vger.kernel.org>; Thu,  8 Oct 2026 20:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791493091; cv=none; b=Mpv9Cv8kf79xoYJ7H3HuQoQWjXhTpEJnWBXJJIefpE0zY7AmyvdYDZ+6LkGoc+KoFLtB05ydUqgh8SoXgcBc65mwfCeyeRpWj4Je2XeArA/lr+Q65+zZWWEVBxN1Jc0pPBilQs5e+Fs90rXmXqSxVlLRFhA38/NnS1OF42596lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791493091; c=relaxed/simple;
	bh=vQAwyxNj3AED0ZWDQ7B3q4d5Ag5/7cRBweYxf4EerGQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=svN6/LCyE2AATAClLpO8y1595TS6nKk7rcAGXs6+KxTlugveXHTFzQIK4+nwOh2JVJX8LruFwxpHT8kOV1TMvE2F/9VsP3yZA7HUsQ0dG6RSY0node3EZCliklz/drq2RlI6ioTYR8oaKgaypMMZOwv40rAt1cpN9Ng6Uk7Iyts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com; spf=pass smtp.mailfrom=amutable.com; dkim=pass (2048-bit key) header.d=amutable-com.20251104.gappssmtp.com header.i=@amutable-com.20251104.gappssmtp.com header.b=MxrzNy9+; arc=none smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20251104.gappssmtp.com header.i=@amutable-com.20251104.gappssmtp.com header.b="MxrzNy9+"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-678febd9307so1414127d50.0
        for <linux-doc@vger.kernel.org>; Thu, 08 Oct 2026 13:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20251104.gappssmtp.com; s=20251104; t=1791493088; x=1792097888; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LSvHBJQxiIqbp6o9z5pfgV7EhGFvpIA3j/HhyOfsFYA=;
        b=MxrzNy9+XPKZgP/QHITHgidKnejBpCbBqpde0Jhs8zaDZ8YVcC0/bmDnKthvi8QN7N
         XA3O6jQt1FITSUNJH1/lcjC5FrPLvMU1GLKEG5KFeSoTg1wFJl7cqPRPvtTJLnjJZTqi
         nVzlADlP+KdoC+dE/CA8m7BBtHxJKE5VAnPEmYfU36WeVhhtTDSWsevHAfI75wPEQ8u0
         mLAiZsDSApZH6fNtaB9NS2/gej1wpXBjHpaGLfA9KZVHWcRUmoBfUnqWJauupHmhmykS
         DKJ7g3T1Hf03AHzIcTFMuRsVtHif8zUYHlF4gRXmUF5H9+7VAUcD/pGLdPIBer445z0L
         uSjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791493088; x=1792097888;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LSvHBJQxiIqbp6o9z5pfgV7EhGFvpIA3j/HhyOfsFYA=;
        b=VCHMpEz5fDnRUKJ99pWhnqXTbQxT4i1MBi1kt/6r1rnxwdBx4JNmUV0iAEMZbneIsl
         vw4YZaNfK4BjwGcBpQeeH8Q/hqdch0/1xvSFFbuCXXf3teuuCNkz6zFKcg+kL80TvhUZ
         XeW9xumZVfXpUtQ6RTjv5rHHATTWf3Oaz6nCrLYAY9v7w67/tv/MGlOeizirUwaTnJpB
         7WBml+dJS6Pod+7aI8D9ap0ANBYTvMGzSeWHworYcdwSqkrkNQda/bDW0Zta76du4VqL
         sP47nwWFfSxw0erhv8rbsPHlG/QrRkEJ7kqY+Zmw7TndRfJUCDFTiRKygmLJ+frZiZj+
         2Seg==
X-Forwarded-Encrypted: i=1; AKwUvBzu9M3bN7xaADWyWLkSmq/JzeDDBNpGzUuMxkMd78oc5oQCAdi++i+o2iAXsu0I6oSaqrl6rYyKIX8=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/oNCl6VFO4aiXp0O2u1rZ6jYcMPw+y0fki7pK5ax8XA98CtTt
	KbejNR+HnPGoPAA7ss+B9NHYWd3z3JkqR7PGv7xFIwR4nQmNKYJZpjrk07f23fpIy1Rj
X-Gm-Gg: AYBFou03LVXJkEmzAo+qfYYJ3ehqfS1CV/Vzm4B7CXlKGygHDmT9G4L1zd7VKWYCNWw
	BwdSW16DuyTBnjUQfPPTCf9WTpwfo6uRB98Aftq3CRfJgvy2XA553Shq15LGlKlXJLufa7dD0HJ
	virEMTE+Lpbsoky7YoOZqZd00nAUwakAD2/uBx3sChT1kAAzqvyL4pLpFCXTTlHMhFXaQ95qcZU
	/ZDVuu1p8+eSxQqDUEAl5BpI1kI+GvWifI3qbsqF5YhZmsTnz/R5efkICsztB3oCOJYFPiXU2fF
	0abNWor8PAJZ8WDVdSIaZl4zHSym8s7dwvLXTDpGAkMS2+UZfgrHhGyEwdz3krB2BfM/cJiuXL2
	3zz1wdSLp3cB8ipWrZ/dKz3ucdnNNm4GvRz3CE509rMhoFwfYOepZUSm2d2R3oU+oGMFsA0an1J
	18/k8YevPJjICvupziP8u/G2h2FcmgV3pmzQRaPw34O9mkQjLtzK7/wQ96LIntszmUyB/UU7ZDN
	SWE5Vb6QUZ4BaGZEqxjJ4ZUNPhuVlgMbMqBFvG9HD3kgnp4YmbpF+4=
X-Received: by 2002:a05:690e:4391:b0:675:6803:98bf with SMTP id 956f58d0204a3-6793628b5b5mr14774d50.45.1791493088070;
        Thu, 08 Oct 2026 13:58:08 -0700 (PDT)
Received: from [192.168.1.110] (104-53-165-62.lightspeed.stlsmo.sbcglobal.net. [104.53.165.62])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67935707401sm78814d50.24.2026.10.08.13.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 13:58:07 -0700 (PDT)
From: Andrew Halaney <andrew@amutable.com>
Date: Thu, 08 Oct 2026 15:57:37 -0500
Subject: [PATCH bpf-next v2 3/3] Documentation: keys: document IDs added
 since KEY_SPEC_REQKEY_AUTH_KEY
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-ajhalaney-dmverity-key-identifier-v2-3-008456d189cb@amutable.com>
References: <20261008-ajhalaney-dmverity-key-identifier-v2-0-008456d189cb@amutable.com>
In-Reply-To: <20261008-ajhalaney-dmverity-key-identifier-v2-0-008456d189cb@amutable.com>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
 Mikulas Patocka <mpatocka@redhat.com>, 
 Benjamin Marzinski <bmarzins@redhat.com>, 
 David Howells <dhowells@redhat.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
 "Serge E. Hallyn" <serge@hallyn.com>, Eric Biggers <ebiggers@kernel.org>, 
 "Theodore Y. Ts'o" <tytso@mit.edu>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: dm-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
 keyrings@vger.kernel.org, linux-security-module@vger.kernel.org, 
 bpf@vger.kernel.org, fsverity@lists.linux.dev, linux-doc@vger.kernel.org, 
 Andrew Halaney <andrew@amutable.com>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.14.3

The table of special key IDs stops at KEY_SPEC_REQKEY_AUTH_KEY.
Fill in all the new ones.

Suggested-by: Christian Brauner (Amutable) <brauner@kernel.org>
Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
Reviewed-by: Christian Brauner (Amutable) <brauner@kernel.org>
Signed-off-by: Andrew Halaney <andrew@amutable.com>
---
 Documentation/security/keys/core.rst | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/security/keys/core.rst b/Documentation/security/keys/core.rst
index 326b8a973828..37ed42382f16 100644
--- a/Documentation/security/keys/core.rst
+++ b/Documentation/security/keys/core.rst
@@ -372,6 +372,19 @@ process making the call::
 	KEY_SPEC_GROUP_KEYRING		-6	GID-specific keyring
 	KEY_SPEC_REQKEY_AUTH_KEY	-7	assumed request_key()
 						  authorisation key
+	KEY_SPEC_REQUESTOR_KEYRING	-8	request_key() destination
+						  keyring
+
+There are also values that refer to a specific kernel keyring rather than to
+anything belonging to the caller.  These keyrings are not linked into any
+keyring, so a search cannot reach them and the ID is the only way to name
+one::
+
+	CONSTANT			VALUE	KEY REFERENCED
+	==============================	======	===========================
+	KEY_SPEC_BPF_KEYRING		-9	the ".bpf" keyring
+	KEY_SPEC_DM_VERITY_KEYRING	-10	the ".dm-verity" keyring
+	KEY_SPEC_FS_VERITY_KEYRING	-11	the ".fs-verity" keyring
 
 
 The main syscalls are:

-- 
2.55.0

