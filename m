Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1032F693F
	for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 02:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764125730; cv=none; b=rtO6rSjGzDq6O8v88t46QomoshuGm39WdV000OQD4nUH8MBYjLiMeKZYXVYRHQTjs6/PVvUfP1FEisE1kTHZI8+jQaaTP+xfcbOd7FX0io0C1nGyuzTDdrubnlXXlk91o0dPi63ZQWTX0W1HZST070pIYbpKAHu+pDvAklNBdTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764125730; c=relaxed/simple;
	bh=8CJ2SlyKaA/OlW3GxJr/00o+eBuXAnhGH3p1lh1NcmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eTETH28E2g7Y96aWnVWc0wi1YpPK8ELjXr9+wdMZSvflQF/etUwh4/5xw7D5II/rEOp3AoQY8x5n1BOjcZA43D2Fv7m5MvZqILBvSHRd4J9//OCu8Q30yDx+ZBSflEbJS/gWBg7FtJZnt3kJ1ZmNL9PNt4oNGMRpn+0DolpXeEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EOqWRraE; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EOqWRraE"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3436a97f092so7720097a91.3
        for <linux-doc@vger.kernel.org>; Tue, 25 Nov 2025 18:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764125728; x=1764730528; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gAlH86EUKlXSx6OnIqYSzQjbfUiuz7Ptzj1DOIebFl0=;
        b=EOqWRraEBTFUVoIZWx4i2OlAKNCAUpSTrZfuq+AijM+BZ49itM0e6VP0tZalTPDDLP
         iciksuG50AgsBPVUCumN+8AhXNTIb6sLknxb40RXRu8uVSGBxQsdsluBcud2eK5rFZ5c
         b6vywit2ILj+MoYBhPxlCrc2oEvc5AmuiuZy1G316MpxkzP+baCcDr45+T36EZ2pu5py
         H/WVI4VvuVKHnhpBHPDikXFNCi8sMX7SRF6hz3N7z245veejVbDO1CLxWF96xFWpiQZs
         f9TM7jbLMee6g8AJkFRfVOP2a1cQbDfc4OvMebcsULoz6la1LywKVPwgMFOmqpCsT0fH
         F/1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764125728; x=1764730528;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gAlH86EUKlXSx6OnIqYSzQjbfUiuz7Ptzj1DOIebFl0=;
        b=ry8wADimonlQCpnyDAWWwNoHkvEpceJBN0l++7YZuMU6+910fGvdNaGsv+gCAUYb0B
         Dvg2XGNojYOnyeP324/SuTSwxPVZuSQA8D1+xqS/HGt6Vq/kCQU0bmy5Pc2ZdQ+F2y9M
         NpnOAYjL/NL9Qle1JLEM97l/MF4ZPMOnpKiIlD5isnsVkGojoJ+TcmokF40/SqOvIsPu
         JDD4SFAB1AEOImFtpmCMDPsNRJxOXlyDlmFLnrK22VEVXEKou7fpv9uh3eOBWn0mJ5fu
         DMoh1tLeHU3zKEfk3Jz59oNvGSaPQueivmiQifjZZYlwp5/vCz8l43QIpP5YilbpwErg
         t89w==
X-Forwarded-Encrypted: i=1; AJvYcCUr7pWV7U2Lmkj4Q2uc6/hsYYKDEWyD0cHA+u/XPbpM78H9zeoY+qXi8oujD/YXRiMYRJysPvgMDQ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YznmMCK2beflNx3iUqOZXEjcpct2aCNuWA6mr3W0SEu4rzswbrG
	XswZNCxUdkrma3IiBfESENtqCZcMsS6uZwXcj79lew+vlWPJkDjqV6lO
X-Gm-Gg: ASbGncv0AFj4V3/PwQc0qQgBk8QljwtoTLpDD9Tn831jqrL5gBQkcJ4FQfP+geWXVFq
	jWdgszNkAOMSdhj5NVxppkwX6IDfA7D+51NfiUMmBu2wMdfSecDLukxs/Kab0RPmd8vcnNvstwA
	cov/0D10PqTRhPdTzw5fbDYXxv7z7iX4Zatrwl/MLgvW/+KHj2m6VVT9FD+64u8U0gRblPhwS5P
	a5VGsFMtKeKgNg1hcP6E5r4L7Hma50yGFN+wzIpn98NGjkQSiVNqq1GUTGfFEfFIbTHhGyON2SX
	6PO3ELlk9+iTgpEa9b4Xxz1HJZGBXmyPGgka+0Pg1WjleMR7jrQtlvCwpU7YOHvA2TdK+xD7d3S
	mwkFLHUwmyMcWJqtRAuGXyv6+Rjy2rU53vnyIGx0HNPIAu3aMzYHp7UQmPIkfp09o2+6VP7zqO4
	cq8nLkPCbsinA=
X-Google-Smtp-Source: AGHT+IEBqAfB1/JXD3AyssNZskaJKmrHPD27KLsS0UpkEE02/MjWXWlqERhRRBA6+odgnHTvf/lGlA==
X-Received: by 2002:a17:90b:3b8a:b0:340:d1a1:af6d with SMTP id 98e67ed59e1d1-3475ed6bbc7mr4597087a91.36.1764125727887;
        Tue, 25 Nov 2025 18:55:27 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-347600de37dsm1452214a91.14.2025.11.25.18.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 18:55:26 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 5053C45A3F83; Wed, 26 Nov 2025 09:55:24 +0700 (WIB)
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
Subject: [PATCH 0/5] Assorted filesystem docs formatting
Date: Wed, 26 Nov 2025 09:55:06 +0700
Message-ID: <20251126025511.25188-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=894; i=bagasdotme@gmail.com; h=from:subject; bh=8CJ2SlyKaA/OlW3GxJr/00o+eBuXAnhGH3p1lh1NcmQ=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDJlq2QvS1ktomSdzzvW9t+6fcWi9k3SEL0fVOhbPaN893 YG1Z791lLIwiHExyIopskxK5Gs6vctI5EL7WkeYOaxMIEMYuDgFYCJ/bjL8L9dbe+/YhH1n9ed+ yhf79Sus8qS/YhfrhKnzjlzU0Yu2C2dk2G+e/aDuj9nSqK0Xdku+uH5Q2Wx91+TWMifffRlMExT M2QE=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Hi,

Here are assorted docs formatting cleanup on filesystems (the shortlog
should be self-explanatory):

  * Patch [1/5] on AFS
  * Patch [2-3/5] on DAX
  * Patch [4-5/5] on zonefs

Enjoy!

Bagas Sanjaya (5):
  Documentation: afs: Use proper bullet for bullet lists
  Documentation: dax: Coalesce "See also" filesystem pointers into list
  Documentation: dax: Demote "Enabling DAX on xfs and ext4" subsections
  Documentation: zonefs: Separate mount options list
  Documentation: zonefs: Format error processing table

 Documentation/filesystems/afs.rst    | 21 +++++------
 Documentation/filesystems/dax.rst    | 18 +++-------
 Documentation/filesystems/zonefs.rst | 54 +++++++++++++++++-----------
 3 files changed, 47 insertions(+), 46 deletions(-)


base-commit: d879c2e0195bd5fd4c48467b95b77e494099c96c
-- 
An old man doll... just what I always wanted! - Clara

