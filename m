Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3A130BF68
	for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 02:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764125738; cv=none; b=hTUMFw+Len7hOXQe+/TjYdCAc1GzWf/74NRjGrb3JNVTKoQRxhy69J097fa5Gp2RgxKK8zKW+vZTWlWyq8MUAZifEsqbp82D+0RC3uHwV2vvPv8WXZJcRg3ohazEMVdI8GOzjbCd/aIFymBa6RqoTR8sziw/GIDjrN8wxZU5lwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764125738; c=relaxed/simple;
	bh=flQQ+p9EPZBsRnUUjNajnPPbgxqkevBix7E0+4gZ/48=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NyMUALNjBaAomTdPRhIRZbLAZsrX7WEQ4ZYQPhN2ffc0sBZMNvma4kiOGve8kx8F91mgioBJIWvFvfw8CwRi6Cg8KJoqUfdrcwIYUYNkI2YttFP350XkigbfO6+9NLeBC3QbTjxhiATqt4mjFr8PFTZk/pSIfyDbd7AZ+FYtgRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T4QV7Uqe; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T4QV7Uqe"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7a9cdf62d31so7458966b3a.3
        for <linux-doc@vger.kernel.org>; Tue, 25 Nov 2025 18:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764125736; x=1764730536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hOi2SSx6yNBsrEeWui+Quc5HTWSCmGH/Tx4kBkU2ROo=;
        b=T4QV7UqeAuWhVv+m4paD7HMDCeUXgRkZQSJ2GYPTGV1f3bfTZGZWV8LFXdwPx7nHwm
         TstgiyAnTdkF4mKe39sxM1sk7cYLW7C5h81/tKsgUxXQ1BV1Koka3z2hkWkRMVvtcufR
         J9UFwODyZfrYuSckNGcKvR53x1Vl1I/59m5EQRoQItR40XgCoOgv0l09zq0gT1LXsteQ
         0RDRkFIsGUifz5XGwCV7Oq2z8wiLzAQ6eANreD20J9u6x1p8cjXG/CfqBEHu1DqEhNCF
         e4i4QFUGw7SzHzRYp7qYmXgUei8MKW/o6lSGksVJF3I21MH1SYpG9qU6cUGRB5CWW2s+
         Zqmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764125736; x=1764730536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hOi2SSx6yNBsrEeWui+Quc5HTWSCmGH/Tx4kBkU2ROo=;
        b=keMLexppDhbwQ0LmwQqqsYtaWzVUAW9JjD+fTdFhaMvcbQjT1qwdoi0D4LSFAI2kVc
         edXFCdkWm77PXGcDKNc+1EgbjO5h+jPzJU2+RmftNpmgMMZ5mc92piTAvs5TCSlTkTPY
         ScC9rp9Gs/pnen8nWy7Oz+vWea0tNbT24+WQQ0pfZFUzs6QU/XhBss8AoCCNDDLFrRQj
         G5ILN9sSzkEM82eNwng00bRjvR/LxDl6tvpV1Lyucc9alN68+e/o8vT3Uzd7ay+1H1CQ
         ZRB7ta2Qy5JSj8iaLubVBMByUkoMUsN9vFRRnHxmzCJCLAg/UtAYq9Vpz5MdDagDWPOg
         YKEw==
X-Forwarded-Encrypted: i=1; AJvYcCXcwtE/2GhxlW+7cYi8WLihMJmLCS5Or2dZSWJwkLnKPcQXaZ+IDgkSO3mYNb4f2P4+rDyXuDjne1M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCKgqF3M8VOOGU67cYXKYABWadisTlCrXrcAeJsCFwq9y7T4Vt
	NLV7AJCWxhs0ce3sHd9sdIuBDQFHBP8k2iz0Y9Q5R+U2yjrRZU1Lj6Nf
X-Gm-Gg: ASbGncsiQyg2GXSNhGAr26GWWaE6I192jRJ5Yaeq7pNA2X+a406gciaktE/VeXhtiv4
	li4vWq6D4jzhlXyZZ8tpnFh2nDMeyU8CHn/uOcJ1Zdv0/4nT0640EPsYIUgp4NedDXh9CP4H/A3
	RCA3Rf32CRlsDyLY9bTSgX5HRLK3+p04JK1hxeVlbT3++b9r20nc1paOWTM/r9qlbZai5mTuiML
	LCBNNCgJ7jsSty2af2lCnTkHPEiTeo2YiuPghg144bimnp2tPRVh20jQYQ+kx2ph6ywPtYnA3tG
	APdxGUTS/E1p9cUh1lW+fUXAtnazGtHiCrzCZYcHVYc4uVZDT5AbbCbLgQgJrnGLNhL0IjCEV5H
	ibAu2yQ7Nlcm3qNt3xRWsBJTB3YiSkia+xPRUsuHfzJ8Jm/um/7/OLrWhSEdKbkyNtP2BAiKbiB
	CS+2DN8hKD/G0=
X-Google-Smtp-Source: AGHT+IEHBzWHbK0JtdGRu7LTkyTetWGV8Bp0c9o3CW5NTNaXLf45k4YycOLV9mqvKMkZ9DY6Jmqs4Q==
X-Received: by 2002:a05:6a20:9186:b0:350:1a0e:7fc5 with SMTP id adf61e73a8af0-3614eeb0d8emr18539845637.60.1764125736418;
        Tue, 25 Nov 2025 18:55:36 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bd775ccabfdsm17407798a12.29.2025.11.25.18.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 18:55:34 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id A1EB6476D832; Wed, 26 Nov 2025 09:55:24 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux AFS <linux-afs@lists.infradead.org>,
	Linux Filesystems Development <linux-fsdevel@vger.kernel.org>
Cc: David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Damien Le Moal <dlemoal@kernel.org>,
	Naohiro Aota <naohiro.aota@wdc.com>,
	Johannes Thumshirn <jth@kernel.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Daniel Palmer <daniel.palmer@sony.com>
Subject: [PATCH 2/5] Documentation: dax: Coalesce "See also" filesystem pointers into list
Date: Wed, 26 Nov 2025 09:55:08 +0700
Message-ID: <20251126025511.25188-3-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251126025511.25188-1-bagasdotme@gmail.com>
References: <20251126025511.25188-1-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1213; i=bagasdotme@gmail.com; h=from:subject; bh=flQQ+p9EPZBsRnUUjNajnPPbgxqkevBix7E0+4gZ/48=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDJlq2StvXp4xeUtVu3yxm+XhsunLZZi/K83SU/sTUfXDX q/gzfGTHaUsDGJcDLJiiiyTEvmaTu8yErnQvtYRZg4rE8gQBi5OAZhIygKGf2bGYZ9OLJZ6rnyi mCEv5of5mmu/0kte/71h41Kry7rK5Qkjw36HOxG1ez8uY7oStMN4eTHb389cjny3ry6ePCNm1ir pYi4A
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Filesystems for DAX implementation inspiration is listed in "See also"
admonitions, one for each filesystem (ext2, ext4, and xfs). Coalesce
them into a bullet list.

While at it, also link to XFS developer documentation in
Documentation/filesystems/xfs/ instead of user-facing counterpart in
Docmentation/admin-guide/xfs.rst.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/filesystems/dax.rst | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/Documentation/filesystems/dax.rst b/Documentation/filesystems/dax.rst
index 5b283f3d1eb113..e0631d5f6251d4 100644
--- a/Documentation/filesystems/dax.rst
+++ b/Documentation/filesystems/dax.rst
@@ -234,17 +234,9 @@ exposure of uninitialized data through mmap.
 
 These filesystems may be used for inspiration:
 
-.. seealso::
-
-  ext2: see Documentation/filesystems/ext2.rst
-
-.. seealso::
-
-  xfs:  see Documentation/admin-guide/xfs.rst
-
-.. seealso::
-
-  ext4: see Documentation/filesystems/ext4/
+  * :doc:`ext2 <ext2>`
+  * :doc:`ext4 <ext4/index>`
+  * :doc:`xfs <xfs/index>`
 
 
 Handling Media Errors
-- 
An old man doll... just what I always wanted! - Clara

