Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1DF48CD6D
	for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 16:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789404127; cv=none; b=qMXjOiudZ9PdMWsXt9v59a4mawPJm1k11hQzmrdc5Tr73cTeV4Icf8XMa0xaUX9KoDHgU/A6WpdZyqlsxwSS6t6biWSJDAvUokdIpByn/AgK/s2fk/jDQk3ynipjAbBRP2aCFZ8Nh/99QpuPyheOPlmCTiFP+tKldRoU1Ph9Adg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789404127; c=relaxed/simple;
	bh=H1l4m7LqRJnZ49EJ8tR396A7/0u8ejG0VymqYOqgnNY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eFhi0aiUTWHPJNDd81axUMkXqu1QN8W5AR6478TanJu/PaiPTsuEqbuv+fwD9qKudQJAl/cmfLr3aMi8vwKcuT7lDfibhKMMfkR/lrgIHa/yce65dZkFwFHB8ZKyk++KAaFX7EmeqoA3KLztbDHeGOJaffcmvzm/fuDT11tcKCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com; spf=pass smtp.mailfrom=amutable.com; dkim=pass (2048-bit key) header.d=amutable-com.20251104.gappssmtp.com header.i=@amutable-com.20251104.gappssmtp.com header.b=D+NfM3JA; arc=none smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20251104.gappssmtp.com header.i=@amutable-com.20251104.gappssmtp.com header.b="D+NfM3JA"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d43da99e9so18073007b3.0
        for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 09:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20251104.gappssmtp.com; s=20251104; t=1789404122; x=1790008922; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OKDUxsVBgyG13X1UZt4eR7O3fTMlydeoVTGRT2zzuL8=;
        b=D+NfM3JAVMqBdhkFR8uFrouOQbtvmwdEK/BblDsiPeia1MBD3YszhT624dIgi7BTqC
         y7QDTzlbwCgCGfGWwfJrI+lzuhU8ncceuex7O1Ijyz7FnytFq42aAJEE5slbbiDxA9+G
         JmnKvb23qGwpYPlp0DiLII1qkRZChnu5vg7oDVty/cHd1q4MQlFFQdRK26HFVcYZogQY
         AYVVKxZV1ngyBVFK23lTZcNd8Le/UWx1k0/U4heT0aSfqy5JG8oegc131+Vs0uKBa/11
         g+f6Bqy1RTEgMjLsa1em4dfCrKmzTRuJ2f8UzRXMNh99Utc0lJjrjFDHAhMKmMKsT8NP
         6rrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789404122; x=1790008922;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OKDUxsVBgyG13X1UZt4eR7O3fTMlydeoVTGRT2zzuL8=;
        b=YF/vuGk7HK7aSrk0vfnq2yibYBuf77HsNFg6biVlX/d7lSWYGFmY6I2MtekfVpXWFk
         RWqjeB6SlsnARWe8axKaq4Q29lQxjWkI9WNAt2M9oc9p1XYlrDwSYprYeBONQg/SKj0/
         njAVxz0ywNIEpS9ccOk1g8uzU+odeTEZUKBQ9qCM/CYzSF5tyMHQy0l9mCei0z+dknDw
         LPQPHujIgoU2hCwbAAWgOYNwUA/GNBmIeCsMOCog7f/NpYWIZ4wFvcfodFjpoShEh+VT
         ysETgcCEmz+8nGtHx6JkNwq1VDb8mvVFUVKZQLRbgw6oucfztJfW+vAsD3zhW17LOr9M
         kFgA==
X-Forwarded-Encrypted: i=1; AKwUvByLW6f6XgihrMwUVnJ0/LpuRZ0SDYtI14biiUKrk8+4Q/XKD+IRms4bFVfbkJaSAaRAxO8sb+J5tmU=@vger.kernel.org
X-Gm-Message-State: AFuF++lT86WeDNiBinjNTAc2BuhigpZ8whlgGIMAvzG+wrDebF22C0hO
	EeuZYVM8OiN4Ly5m6eN136c9UfKIgMUz1fvT0wueh7eAteIwA6Rd81/zgHMAriKNm6gP
X-Gm-Gg: AYBFou2RPaai9RPwmgJ/wkcK/LzRn3MsdAJesSpy9dc2vXUmkdMv7MzfAXgXavhTDlP
	XmAwT81gHhTsKcQBHiV63I0lFB5v3hoV4E9tDIuO6/fPf8ALvMBHEDkgoqOxy/xIivdFCEpYI2C
	/UwEKNN8eXGhC9XG/VT/XrBBCIOy3qEY95u8N9vnYdfAnOl5782+/aL4F+WbYaTxZjeSHAiXWqX
	5aa2FGZ5zJmTxM9EWu6dgVC9UHvwHzIjUnv2q/VbaiBrHNkHPodGCXN9jbWOMznkYnjc/DWwOyc
	pJ+GUa2bz2XxnYx2UNLLrKFxVJlP6haNx6HiptyvRk1GUXTIu9sMsnVCXdbK298+bUefqq91wyx
	PU/BVKROwYIIpUp0ut88CVUwAqXz16CFiwnOBI+6Nn5ChiZogzMM/fVGgrnOoFpvMmY+ZOAh8jR
	U4zf193x1k8sReorqtKOZMISl9+8brJIzIUXbW/+O+4d3ialonqLdxxmp4+sqk
X-Received: by 2002:a05:690e:12c8:b0:66d:132a:875f with SMTP id 956f58d0204a3-6714e088222mr1068042d50.47.1789404120256;
        Mon, 14 Sep 2026 09:42:00 -0700 (PDT)
Received: from [192.168.1.110] ([2600:1700:1ff0:d0ef::d15])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67125df42a8sm4879023d50.8.2026.09.14.09.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 09:41:59 -0700 (PDT)
From: Andrew Halaney <andrew@amutable.com>
Subject: [PATCH 0/3] keys: Add well known IDs for fs-verity/dm-verity keys
Date: Mon, 14 Sep 2026 11:41:41 -0500
Message-Id: <20260914-ajhalaney-dmverity-key-identifier-v1-0-01922dc1366a@amutable.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3NSQ6DMBBE0augXqclbIYMV0EsTFyEzmCQjRAIc
 fe0WL7Fr9opIQoSPbKdIhZJMgaFuWT0HFx4gcWryea2zu+mZPce3NcFbOx/i7bzxh+FeIRZekH
 k0tyuXW2LokNFujNF9LKeH017HH+y3YXWcwAAAA==
X-Change-ID: 20260914-ajhalaney-dmverity-key-identifier-4187b6233be5
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

This more or less follows the bpf keyring approach, allowing userspace
to easily find the keys instead of having to parse /proc/keys.

Signed-off-by: Andrew Halaney <andrew@amutable.com>
---
Andrew Halaney (3):
      keys: add KEY_SPEC_DM_VERITY_KEYRING
      keys: add KEY_SPEC_FS_VERITY_KEYRING
      Documentation: keys: document IDs added since KEY_SPEC_REQKEY_AUTH_KEY

 Documentation/security/keys/core.rst | 13 ++++++++
 drivers/md/dm-verity-verify-sig.c    |  3 ++
 fs/verity/signature.c                |  2 ++
 include/linux/key.h                  |  2 ++
 include/uapi/linux/keyctl.h          |  2 ++
 security/keys/process_keys.c         | 58 ++++++++++++++++++++++++++++++++++++
 6 files changed, 80 insertions(+)
---
base-commit: 1a1de54f7369cd2b5bac0f265910e60ad3a6b4c3
change-id: 20260914-ajhalaney-dmverity-key-identifier-4187b6233be5

Best regards,
-- 
Andrew Halaney <andrew@amutable.com>

