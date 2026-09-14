Received: from mail-yx2-f3.google.com (mail-yx2-f3.google.com [74.125.224.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B8748F850
	for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 16:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789404130; cv=none; b=SJPfTHy5Ci9KxJQnD86vUxsk5lSj/Kmp+rtdahny9d519EZqEbM5vy0lMkbp8L3rroQF5LB4Wp3+houuCu1iv/FbzlGmcaDDei2nLXJAyYxumrYJtxYDvJDvA8wW04N255wVBwztK63J24PvVI4ecF3AgWECcw3zhFQp2kxl4Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789404130; c=relaxed/simple;
	bh=fyPrl3WvozGTDDVsDO8MGVfKnhRCs2T8g6qKeea9uQc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P9b5zU4Uyu52yNwoY37zRXxi5qNU1WRAm+HqA9H/vnK05BqX8FZ/eYfNlNZCPo0X7ZprS3Ny0qX0i6aWeGVX8ldlgu64i/JZ9Szkrj7RXbP2ygwGj72pXbuD3z/wMW1iLZVTxD9OteuSGb3rvcL0rJLOcCAWEz4HcvKafb+TGdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com; spf=pass smtp.mailfrom=amutable.com; dkim=pass (2048-bit key) header.d=amutable-com.20251104.gappssmtp.com header.i=@amutable-com.20251104.gappssmtp.com header.b=f5lMeVgu; arc=none smtp.client-ip=74.125.224.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20251104.gappssmtp.com header.i=@amutable-com.20251104.gappssmtp.com header.b="f5lMeVgu"
Received: by mail-yx2-f3.google.com with SMTP id 956f58d0204a3-66fd0af9eb0so1249831d50.0
        for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 09:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20251104.gappssmtp.com; s=20251104; t=1789404124; x=1790008924; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ndMM0TFrryHnZOvHnxhOWJr9tGmJVwIhyX6o7UKbX40=;
        b=f5lMeVguGh1mH4Nna49X7IZNiBsDiRwwgHAAwhJRQY+ZByij2jyEx4lsK54K5OA2+e
         jFm9UiDUQT3kDyC5tHE/XGiNnorfF2b4xKZPEvrPqNyY0+M2Hgz/zCdPva7/qr/9dOOm
         UfQzb0QXf+wLNVjOK6HTBvlVi0SsMFokmKKGN5+bduK+hDLiRorkhsn+7G7qYXHj2siE
         beLXJ/xcGk867HZ5ZqoElH6M34ATJo2y9mFIG4m878j12sup1h1i0S/LryjR/yf3yBHv
         LLAqBHUl72QrDEwXVRhWS0cv2jeK0+wGMdBDFwu3ZMOQ2VNx0SBCK4ibsE4f/lm5Ur4n
         6cyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789404124; x=1790008924;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ndMM0TFrryHnZOvHnxhOWJr9tGmJVwIhyX6o7UKbX40=;
        b=eTUiXvp9FSbPDguqqH77uz1oUGUbXDGtkhiVjh7LbYqjmhOsqvYHUqXVSD7s1vJWrC
         0adinXUVirOwpMu//VOvbIjme16+WdfMY4HdP33qndiQLqOJCTNikFERKQY/lIAQXa2f
         VnhE/ADLBYG7Unl91yI3JOtc2ojxTCOHJ7qZfOplYHnohl3PsQf+dyJ87e7Qct2VmODL
         DLFKCGfSWV1HUXI4nSfie7jyJ0IT8Gs9vaKQsVep64xGF9WndxeoHGQg9qPw9cEmAX+O
         BRXSXt2wWpWh0PGF99+8nAM6Ty7DjOPsk2y40dr+1EJHWW6c3R59TfR3zSbasuo9TVNO
         VDRw==
X-Forwarded-Encrypted: i=1; AKwUvBxUE6dEiNS0i8vvHDENWEM+HDe+W8fdga5kOHljs4IpINUukl3WznHUvgKC0zCFiDmvZJxtMqIuBvM=@vger.kernel.org
X-Gm-Message-State: AFuF++nh2o7HqDupI59N9KNr7uEHZYUaQIUHT8qt4qpfTnTl4K5zrJAH
	TlI+jAUP+2uZrNv841sBN1m/105SyhMk12IN+Y+0vEwAXAXO92zi8+GqtK6QoT+n9BdX
X-Gm-Gg: AYBFou2aEVKvhz8p6QE6LsgZnr6oQ2mxXUzePDDV+Z+2aFOxSPc7fD0T1MMH4xN8gUI
	GccLj9LRhn/mHN4df7WJE7j9DoJOcIqXmCvi9t+dCdc49Gp+J0HUnij+lisuRu/u10q3sJe0vab
	uDk2ZJRGkVn2F12g8mlcrMlmUSqTU4FXxTu8t5frj4p3PvFbR5yAQl1aQpoSTMs8+R7VTFNX/x4
	/rv0nCRbF2G2sM1PqL4nT4nbM5iBcDGjkXKIondL+6MuxWpvMX4erpsnhzpACFzfZgdBWNNZU2p
	9pI6UqMyISoEGdo7C2bNAhvb4YddCx5v8nHMRt9O+g/4SnthCukzLsQnRHBUTJ+F9Zyu+HwVT96
	jBSNr4mRUK5ulT5argrmBRhKCpvTTW/FGo9mKHK9to0GSGL9fWcJJ4zjBNjjAm3ZhMG01wXoSmY
	S1phLOoi+YoXMn9KlTfY8OpYHW12U3pAlzEca85ORKWyjHr+4EQzBTfJhtVtLf
X-Received: by 2002:a05:690e:810:20b0:671:4a9e:7c91 with SMTP id 956f58d0204a3-6714dfd252cmr743318d50.10.1789404124390;
        Mon, 14 Sep 2026 09:42:04 -0700 (PDT)
Received: from [192.168.1.110] ([2600:1700:1ff0:d0ef::d15])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67125df42a8sm4879023d50.8.2026.09.14.09.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 09:42:04 -0700 (PDT)
From: Andrew Halaney <andrew@amutable.com>
Date: Mon, 14 Sep 2026 11:41:44 -0500
Subject: [PATCH 3/3] Documentation: keys: document IDs added since
 KEY_SPEC_REQKEY_AUTH_KEY
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-ajhalaney-dmverity-key-identifier-v1-3-01922dc1366a@amutable.com>
References: <20260914-ajhalaney-dmverity-key-identifier-v1-0-01922dc1366a@amutable.com>
In-Reply-To: <20260914-ajhalaney-dmverity-key-identifier-v1-0-01922dc1366a@amutable.com>
To: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
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

