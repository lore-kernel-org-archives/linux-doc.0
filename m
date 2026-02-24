Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260E62DFA25
	for <linux-doc@vger.kernel.org>; Tue, 24 Feb 2026 07:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771919582; cv=none; b=j+JvMNYWiGykQWx0rTPXi6LuvhBAFFkGTofMqXTt1YU4R2Kt4tKkCivSqQl5meLRSMN+CW6sVtiFSvoL3TA+Ff9ThfzcPbY4PzsIQ5JoIgG/8OLpuEbsCWdV4u6RZd/EMIwuq2hi4flsHsSGTvkp424MMG6RTvvWvueiOmIeji0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771919582; c=relaxed/simple;
	bh=CTMXHtwe42qJP4jF+6CSJ752Ql5TBa/IN+aUiF5ca98=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L7oGUg8pRnZZdaXU25RDBt3VIPgYRVH5JCxiTu9fR7lC4JfUw8Wh3v6eS9NLlT/+cuGG5bcUXHJx+v/lO3eMXLgv9GXmlyDIkDRj/P32YuF6C1ERc7fQNi8p/eBngFdD13i99NwhF+EKOrwQ0JMBkmhp9vbT4QoVrDWpE2+F8yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qv5Pljb3; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qv5Pljb3"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ab46931cf1so37830215ad.0
        for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 23:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771919580; x=1772524380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+/k3i3EVK+dReOu1KDSSSE109KyyCg6uZzJSwqggdWo=;
        b=Qv5Pljb3p0B4ERQl9rZgzSSxqJssdIr/GzM9+3ORWn1iqc45b3lAUf6LkKdVvU+KhM
         DqBdVgthriwyGCM6VhKsYckuiil3UjZDxgdsNZ0+HK0OMemobBYUZ1cy2dE6zyt0TwAt
         sU3JDEz6Ij3GfxO8jPCxbvxUOAgNXwUPGE+ZUeZymXYWUNzKeroljVzHuVLEthTYLCcY
         3PIHyeWxdP8NuXZJ9nGGCwDWifVimqMLaM/UKo6XgPv9nYFNtxqdT7gE8VAFFYaeS+H0
         UxliJC1sLQbuj2OAA0K8sxbWYbcjSi3KkzOJxpATrVY1zmYlS16gDDADB9lnCX96dLBY
         NrxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771919580; x=1772524380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+/k3i3EVK+dReOu1KDSSSE109KyyCg6uZzJSwqggdWo=;
        b=OgCF7rHV1EWvgbmBaJdWZOAkY+tnHl0sZ60ljBEjrSSb0lp7xbykJo4kp8wBMlzfvV
         v5VPn3SRkbeOMeE/fvpbK1Rn2JDBFihQnibN4O6Hl4x1KuVODjbilNBV0XWUlWwIwgHB
         ryt6cWGt7JptMnVkSqfyoT9AfRseh8ZHX0ieir+ykJQirhA0p0NJaWeAG4PsiOwQ1yIF
         A38XBvYHa5h+0t14qTNPkNtWQ+Nj7KbfhS+rCzT9utKgljFibD4cl8+ISk9ijJD62hQ5
         uAjYGxLEwKjZT3MKN6BG61X5Wyi1DuiGT7ZuhGZL8IXhNAKymHQ7OmCTsayQpJNqpHGn
         Whbw==
X-Gm-Message-State: AOJu0YxVqyTa35GlJcT+rTIszG30fH/h/GBwSG55d8EAyLQ0eMM+wlaZ
	gcUVnaZ0/X2ImkaQgXM7xQ0nLptFuqWsBGXbd2OHPO57yMaowZhH/rRB/JyejDZM
X-Gm-Gg: ATEYQzzQoIUh3ZI/EmvemtsApZRi6CejC5ORPns/L63w/Mk2etu0C+Lk3tvBSqDAP3a
	QX8z676llYO/avlTFgX4rQN8ZlDe/wnt3rMZXvksa67gZyTbmfetPJhz0hK9J8ThuFk8lqyWBVu
	8UgiOuvOrWIl06dNBeeBya0rvVSCwXJDZV2Ph3D8g4SxpiFaKolgL0/5HO+qSMMXzTufh5TCy5P
	yKGi4UCu/mLwQNZY1rjA6OX5oq4UfmA7WCIt8DWvpONK55kRp0b/aw2T1ZJTMmH12jNj+yiZa7L
	9U5D2LcxPUteK1YduE40uJFXtFsdO9qP8T60Z0svhF8+F5WHEapwgmaI0LKcqLTEb/QxszrQx54
	yIVX6IV+/QK9YbwmsYKWRYw2J3iJVpEb44NXSVn8mdsxr2xE25qZPVilokOXmfFmW1BgCWfCa0w
	hXJithiXIpVIUEY5nA5F5+ivbg7d83DUg=
X-Received: by 2002:a17:902:f689:b0:2a7:80bf:3125 with SMTP id d9443c01a7336-2ad74283eeemr111833625ad.13.1771919580439;
        Mon, 23 Feb 2026 23:53:00 -0800 (PST)
Received: from localhost ([103.251.247.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad750275d0sm119813615ad.61.2026.02.23.23.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 23:52:59 -0800 (PST)
From: Ariful Islam Shoikot <islamarifulshoikat@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	viro@zeniv.linux.org.uk,
	Ariful Islam Shoikot <islamarifulshoikat@gmail.com>
Subject: [PATCH v2] docs: clarify gcc and clang support wording
Date: Tue, 24 Feb 2026 13:52:49 +0600
Message-ID: <20260224075250.15375-1-islamarifulshoikat@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260224045937.GA1762976@ZenIV>
References: <20260224045937.GA1762976@ZenIV>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Avoid stating that both are "fully supported" due to
variance between architecture.

Reported-by: Al Viro <viro@zeniv.linux.org.uk>

Signed-off-by: Ariful Islam Shoikot <islamarifulshoikat@gmail.com>
---
 Documentation/process/programming-language.rst | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/process/programming-language.rst b/Documentation/process/programming-language.rst
index c18e307ccb56..25ec1c99e2ae 100644
--- a/Documentation/process/programming-language.rst
+++ b/Documentation/process/programming-language.rst
@@ -4,10 +4,11 @@ Programming Language
 ====================
 
 The Linux kernel is written in the C programming language [c-language]_.
-More precisely, it is typically compiled with ``gcc`` [gcc]_
-under ``-std=gnu11`` [gcc-c-dialect-options]_: the GNU dialect of ISO C11.
-``clang`` [clang]_ is also supported; see documentation on
-:ref:`Building Linux with Clang/LLVM <kbuild_llvm>`.
+More precisely, it is compiled with either ``gcc`` [gcc]_ or
+``clang`` [clang]_, both of which are supported, using
+``-std=gnu11`` [gcc-c-dialect-options]_:
+the GNU dialect of ISO C11. See
+:ref:`Building Linux with Clang/LLVM <kbuild_llvm>` for additional details.
 
 This dialect contains many extensions to the language [gnu-extensions]_,
 and many of them are used within the kernel as a matter of course.
-- 
2.43.0

