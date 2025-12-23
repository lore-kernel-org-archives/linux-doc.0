Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779712DD60F
	for <linux-doc@vger.kernel.org>; Tue, 23 Dec 2025 03:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766461996; cv=none; b=QRgFKezDWeKTbDGxH4Frq7covIfm2F4dy0mp8BzLkjrP3eXnXMwfZB5j6wqEBfifxEe2bLZk5U/AvZGV5O9QR44kthPFPaQ/Ba9SECzSXEChNFLO4UcTD++XMMrsqRdesOvtQqCV3HKXkKdJ+ZIF+tAIV8GHQRU+L0U6QREavQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766461996; c=relaxed/simple;
	bh=zL3+iAHw7i0eC3DMTNVs3sFNpbeN9Zcje4E1gx93KDw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GLhCrPVwFLesrniDPDu+aMqBvPjsErpN/kHD9gAxu5zdn5M8lNpFdt3Olpp90j6yh8sKquXGBIbKIVWYlTtJLcrdTqtjuArNXfWnZo06yzMANAasQ23qJO6rVbSIARyv3AvOEOWkqy28WcyXgxcxCJmdTqqqE+mjdg2ybiwT4N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZsWlZP9O; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZsWlZP9O"
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-2a0b4320665so69865585ad.1
        for <linux-doc@vger.kernel.org>; Mon, 22 Dec 2025 19:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766461994; x=1767066794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8oTVO05racKuXuCQoyM6f9YU0tg6uDpbKgJo8uirwrE=;
        b=ZsWlZP9OZo0PWIl5iKEYKdxoF7bJGebJeWTFXKJJzCEwHBrQeu/Um65qqKotfKASXG
         B0mqQ6ocNYz2oLP6+9SD0fZjyzN9Z0qKQ6TWkH0AgLwDcE70Vi5yEmKtE91RAmRocCiy
         HaxpuFMMYXs32tmY4OAfmuqWeHswjMW9nCcQ16L/2bUmqw1EgoYzCzGP0vW4vGLPPCOU
         karwXiYL8AODVw+5CY4cE1dUBwNvNrqku/cw2kU8pNBGDzo9n5Q3kkN+6/Y/r0Mo3HNl
         /8BWZxJpcTUzL0+iUkjRTARGJvSM4DALgH3ibVe0nuvSOvw/Qm4U7PMXVpBG144qZ88P
         YS5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766461994; x=1767066794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8oTVO05racKuXuCQoyM6f9YU0tg6uDpbKgJo8uirwrE=;
        b=Z6fkfIf7WSUkEjxhezVu1IyN/ZfoPlnk4/XiUDG9OAzq8x7A4GBtAOZqkYQygl0Z/V
         PRQgIXs3eqdu9JMuQhmpm4BLZTDN041gjjOrtM3TaD4A7MYSoR+oPzhG0HrjALUNGFSq
         /DNxexuAcB6p8+wTpomYXqRb6XjyJMiof3crFLzy3785w80spgj+RhOxc7XOYWge3E1z
         2IryUBD7DnzstNJ3dwD26QSh+Jd1xn8cwcpzPvOMDxNYYqWyfnhJn59BTwRlk+2yp7QU
         S1Gq7vHOTjMgHR33AtdzWwScljPGQAlMdi8EVXcj8oBZYLz0Wsz+BuWhQ7cnu6cyY48q
         RqsA==
X-Forwarded-Encrypted: i=1; AJvYcCWc3z77Fwca2ea6tNGg4V33PUN6svDAd7IpZEE4j5knaWCj7OMZ7qn0dWk3F0Xv9r3N2U1Th76SjYA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw26yUNn6mT2FQXjyJqY8QIcROgKJAZCwaVbUw59uAIJQ2tq6uW
	xlkvrWdBoMXsnCh+WBBugGPj1Cru65Gv8p6n8F+toZ6GCUKcZR+/xJlUtpqmG2ZyFCA=
X-Gm-Gg: AY/fxX593gD8bgVrKW2Xb81c1FXlpE/B4hy/JE5IM3f0zvLyRTyAcqKVrPbI7bmRLTy
	wYiDTx9NZu6s4qjlBYdzxeJilAepq0kjm7vJnJz2lctjZHBIS8gRXeYjEYe/VmiI4n2Fg07zop+
	GfgtQlsECzBQF+pkPDjWYWmq+stKMhkbFCYaE1Vb++Z2SxlHiSqOwv2TRYJzULzRoyQwze+3hxq
	csDLVLJnPS7LBpAXvrfcbxQdpNM1tbL+Y2MD7+5fFWL6LS+M4YrHig/f5fhuU1a7y4M/ozZaRIl
	m5KudTh8hLdh+Rr/IsDM8hW+UF+9W3UrfDmly2JJ0h6r8lWhxI2wP0nrLFi9NI7xpMGDFLTvG8o
	e/OkGd+9H7OWN6fgL3lWo8vpblQuSYDgBahsb/vQvmZZQM3XHSGmac+pFCjmvQjJHAR3h4gB/Sy
	KEe9sIKT2ZA/0=
X-Google-Smtp-Source: AGHT+IGN3QrAEj1R6BV4eOuLMFIvhd9iGan6H8R2GFmRUCJcA0eXT1yayPnuLwho5rHsvACSuU7X/g==
X-Received: by 2002:a17:902:e74c:b0:298:5fde:5a93 with SMTP id d9443c01a7336-2a2f2a354c9mr137134975ad.32.1766461993670;
        Mon, 22 Dec 2025 19:53:13 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c82bc9sm112488205ad.36.2025.12.22.19.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 19:53:11 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id EE471422D8A7; Tue, 23 Dec 2025 10:53:06 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 0/3] kernel-hacking documentation cleanup
Date: Tue, 23 Dec 2025 10:52:50 +0700
Message-ID: <20251223035254.22894-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=646; i=bagasdotme@gmail.com; s=Zp7juWIhw0R1; h=from:subject; bh=zL3+iAHw7i0eC3DMTNVs3sFNpbeN9Zcje4E1gx93KDw=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDJlegi6rfrgl/9J4/Pb1/viM3f+u+Zx1npgXUSG/6W2xj cvSok37OkpZGMS4GGTFFFkmJfI1nd5lJHKhfa0jzBxWJpAhDFycAjCRsCpGhqU75jwP9n6o3uqR +X6pl938m2Jrzggs+HP5xYIfTR8t+Ocw/LOI8Kw88vWO6uIp/NZp1dGz2z5MkcpITfdvPG65/LZ fMw8A
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Hi,

Here are additional docs cleanup for kernel-hacking documentation. It
is based on Thorsten's :c:func: annotation removal [1].

Enjoy!

[1]: https://lore.kernel.org/linux-doc/20251222232506.2615-2-thorsten.blum@linux.dev/

Bagas Sanjaya (3):
  Documentation: kernel-hacking: Remove current macro annotation
  Documentation: kernel-hacking: Do not italicize EXPORT_SYMBOL{,_GPL}()
    references
  Documentation: kernel-hacking: Convert internal links

 Documentation/kernel-hacking/hacking.rst | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

-- 
An old man doll... just what I always wanted! - Clara

