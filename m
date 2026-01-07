Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D57F315D2B
	for <linux-doc@vger.kernel.org>; Wed,  7 Jan 2026 12:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767788536; cv=none; b=JSj4hk3XNHVYbu3aA7IbO4qz9Y+8YenBziS+iL2TaNLhgcuVmOQ9mj143srSNK+HMyRBNL652v0iJ29SUCb08Kgr/YK0DErNNhz0oPXqW82GqTJmCB9iNJF8GKFF2gkO0CSklUmmkcwa1lRrinihpkFXNyU4aZKxafIu2B1Y2AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767788536; c=relaxed/simple;
	bh=egHdS2hlDtRjrCIJe2FUsvnOl3UfhkoxLjvjeC4YPPM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j3wSzkWXKs7cLFd1Jgrz2cgDJufxsLfTQNFkRkE988VWNLnk/Q9cbimysuAck3uOwtxIeGl/8CEqjTvg9qTZqri9dKMrdW2NPUT3s8ktneSUEyIKFYDx6PlioM4dp3NpLNBqI2NCNwaZv1p0cS1s01GsR0koZF+uH/1G0FIBeGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GDkKZdu3; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GDkKZdu3"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47d3ffa6720so20077885e9.0
        for <linux-doc@vger.kernel.org>; Wed, 07 Jan 2026 04:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767788533; x=1768393333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X8OnKSVJBnBS0jE2Q7tvL94jmLG4UOTIQCS5eTSEBgs=;
        b=GDkKZdu3b6urCFeLFl8AVnk2F4RyCQoEtzQjClc46LE6j8EZohLnnRC3IA+fQixYfN
         eEP6G1EbpdTz24DKGjaCdzmuebFG22VmWHnte2Ryh/SPSS1FNtZlsTf009I8VKCeaHCf
         /vosak+URWbXzKyseXPU4qsrGeDgx3hMJFn8Q+nCkgBopgTqaWSmQb+q8wtmrQZBM5em
         bwWA/usbeAESxf9UdVqF7Nb5LN4IhyxiTb4vGUBNEs6NovQB6JgBs1EZ5mcgENpvGTKE
         9obbt/VxLygCgVcLr3y68l7Enm2xMTN9ticmI2P7RfeUy/avjAMJPiYN4J04bYmX10QC
         bc6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767788533; x=1768393333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X8OnKSVJBnBS0jE2Q7tvL94jmLG4UOTIQCS5eTSEBgs=;
        b=jq/mp2O+qpVLfvtx4cJk1XC2laRsAZ2R2TzM8feCS2xEaK5qgm13cvua3iWuEDHYI1
         wsCSBA2zbt0sRRUM9Ep9FlQy6a5HKR6ts3qM5p31El1ebZRNwpo9eOnBYuvOxvqLsRkw
         jMrg1M9LEeop/hX7c8ViiOEBZ4OQpCN4huzt/9IQ8+acio+9SmVhNiWMsV91gmXhkzIt
         uic3S38gnLBmPRd12D3sR+PCcQLddGa9XEZFbQ3oCyGQIzF2qMJXLvFfsqkz5V+4ybgY
         yL0y1wSBXHZUOTQ6TwJWFPdx22tgljHM1Xk7uOufXtg1Zj7O/ys5Ll/vNXyvfLaaKQG8
         qg1g==
X-Forwarded-Encrypted: i=1; AJvYcCUqpeX7OmIlBmMaeMx4vbKCTizWMuxk8dWouXk/ODKXP+S2OuFxk0PIIti0iZ/57O+oqXZGXhaH6Yg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEVlcm/+z4Ira+W2R4MoG9OaYUxq1Yq7t35+2KWYcMYT4cJywY
	iVvn/H6ZiZFosH/P5nzD1pz9DYJWzivW6qLmzF5ur7j1UjoMhtQ+VpPI
X-Gm-Gg: AY/fxX6aZW8ZRGgTAnjfuNWSOdiaQHJP4sNGZ7kykm8pZhT1nMsd0jv3IMonmdQGzlg
	ytNA5g0FvVeI9hZxQC/D5BYjJyifdHszNm50SRMXs/RsNOQsaRBXkmMf7ArH2bycJGdzsrT4SP8
	ltdYhEtR9M2MDWNT1Hx+xpOil8NLPn7WwLN5D5ftdhVxDliNk75zJ4dYpq4eqALymLQmjfvowla
	fXF7UXKnOAi/qmANX4QL6SB5Uxa1C/gzkz4MTno5kyDLj1B3gpwlhAMAJTpw75x+Lv84kofWdrH
	9jvQnvxwJ8HSVEBRiG16kswibR39H24HECu5ouI5drn61qmIY90+gl7pmsGVt9mxFxsd/ntJE90
	m21kF3akgteqtCPumFQwAG2aEoTg9CdUPzVyDP+Pz6x0yEYP0hHZ5jin06oAcGl8lN8W0jVFWtc
	XIUoU73duema339wAHGJc5YkCPWsxX
X-Google-Smtp-Source: AGHT+IGQ1Nnipuu1ciny2peE5qR8hzMsadwhCVBfjPXFu0Kv0BQH+EWGDvyEMW6fE0ZE/CgPnIcYbQ==
X-Received: by 2002:a05:600c:6306:b0:471:131f:85b7 with SMTP id 5b1f17b1804b1-47d84b1a03fmr23913085e9.15.1767788533333;
        Wed, 07 Jan 2026 04:22:13 -0800 (PST)
Received: from imac.lan ([2a02:8010:60a0:0:bc70:fb0c:12b6:3a41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e16f4sm10417107f8f.11.2026.01.07.04.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 04:22:12 -0800 (PST)
From: Donald Hunter <donald.hunter@gmail.com>
To: Donald Hunter <donald.hunter@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	"Matthieu Baerts (NGI0)" <matttbe@kernel.org>,
	Gal Pressman <gal@nvidia.com>,
	Jan Stancek <jstancek@redhat.com>,
	Hangbin Liu <liuhangbin@gmail.com>,
	Nimrod Oren <noren@nvidia.com>,
	netdev@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	=?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <ast@fiberby.net>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Ruben Wauters <rubenru09@aol.com>,
	linux-doc@vger.kernel.org
Subject: [PATCH net-next v1 09/13] tools: ynl: fix pylint issues in ynl_gen_rst
Date: Wed,  7 Jan 2026 12:21:39 +0000
Message-ID: <20260107122143.93810-10-donald.hunter@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260107122143.93810-1-donald.hunter@gmail.com>
References: <20260107122143.93810-1-donald.hunter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a couple of pylint suppressions to ynl_gen_rst.py:

- no-name-in-module,wrong-import-position
- broad-exception-caught

Signed-off-by: Donald Hunter <donald.hunter@gmail.com>
---
 tools/net/ynl/pyynl/ynl_gen_rst.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/net/ynl/pyynl/ynl_gen_rst.py b/tools/net/ynl/pyynl/ynl_gen_rst.py
index 90ae19aac89d..30324e2fd682 100755
--- a/tools/net/ynl/pyynl/ynl_gen_rst.py
+++ b/tools/net/ynl/pyynl/ynl_gen_rst.py
@@ -19,6 +19,7 @@ import sys
 import argparse
 import logging
 
+# pylint: disable=no-name-in-module,wrong-import-position
 sys.path.append(pathlib.Path(__file__).resolve().parent.as_posix())
 from lib import YnlDocGenerator    # pylint: disable=C0413
 
@@ -60,6 +61,7 @@ def write_to_rstfile(content: str, filename: str) -> None:
         rst_file.write(content)
 
 
+# pylint: disable=broad-exception-caught
 def main() -> None:
     """Main function that reads the YAML files and generates the RST files"""
 
-- 
2.52.0

