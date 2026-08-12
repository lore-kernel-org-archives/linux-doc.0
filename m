Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6737D48422A
	for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 18:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786559035; cv=none; b=riY0nLhJlLK5IVuii4PmJ+OK7uJdEBMNS9sH8GjqjTOx8H0XeWK517Udf0HTIKvf2X2V69LTBti4H31nyd0qb7QoaMsin+eHCgFKshYF+0664T8FglVb7CbV/Mcv1Clrck85f9O2veP7C2W7DaRT+TGj50njoNEpL74rZN4Bgrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786559035; c=relaxed/simple;
	bh=Kb/hBUPy6b4e8bpaHqBmWRP1I4kTLY3QnVfF4XhM4Ho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mr8syKhTrHy7DPCJvkUbDAUDT34dp5GtBG3wWVCWJfrp+dRLuzMTgaleETdWsBkqD4kEhvP4e/PegYR1J08Kx9QABeWutI3d9/IYug6pal2YyUXzHVa4BVLira6yjJ6MTrxsH7+WEaLo63y63chDAvqQRqFfJf+H7QBvbs43Gco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=phGc65Gx; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="phGc65Gx"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3810c5d691bso1042014a91.1
        for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 11:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786559034; x=1787163834; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Nks8VC3vHUBzywbcvluMteExgRFIxGN8FNe5HK/cCDk=;
        b=phGc65GxD4GRkYuHOuImsOnVECKzTC82/hg8Wok2PNjNJbCG5lYsPSUClBxLt72BVc
         SjIBx1PevoiNm7cQXVznyRKHJqcOXG5O5NWD3tlMEiGHjbOXvIW4DA4pYnd6jVulwggu
         S9PdIDvuqbyuV+stFuPePP5vZn+hoH00XjFyjRqjaLlVZ0GqKni3lW/baB6KKOdhZoii
         kHy6gCRK1/NlHfhjCiNU0wyfPy6bvenh/N/0sb9ZOljIe/8OqL4opXsbMKJt7widk9Rn
         ZBGImg17LfEsj7OJYOyvl7oIh7erNkSLiuvcbJl7I3xEdeyftotnsTXAJopzSOQVx0ty
         yy1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786559034; x=1787163834;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nks8VC3vHUBzywbcvluMteExgRFIxGN8FNe5HK/cCDk=;
        b=gs7cdy22dD/wBAI+NrGTuDxKH/p7dCux7tLR59VHArxTjHaZy8YNfUCEJ/Cs3d5Brq
         6BZSivPEesL69RHdbxBoFsmYFPUKNRfcA0obvRToDqjD2PwyriLO5VTkdo3i+NDjBWSU
         4Bn/Rixms7qHAgHjcV9MHW3/a1+C+9WUo7AH5cJtNpLPe+lG1xSBuRfc7U8+ZBUGU+Gp
         WUNJEZgvuMs0Ird3bz/ORvv/pz+xlW3hQzQ+UfvADbedN4PbkOYpwTV8irQsKHenaHwA
         uAQhwOtUClvaTD9QHqKclRpYmU1+6iqoYzKlQP3w5aeZkc/QcZZg27b7Dd7asBjvpudG
         3rOw==
X-Gm-Message-State: AOJu0YxxplR9k+tT45L9AWWjGCualehmCpyT8kqG74+DSnTt0507fiL6
	FXxhzaSECvSUHJk7mmaqr2nOKNY6nsklqF+4srI9xXR767RCjFzIK0xj
X-Gm-Gg: AR+sD13IwflwQEnbE/Wp+sIDl7/Ucc596ncEGUNu73SBZpjuZBaF7neluds4p206L4e
	wFrVQB+wdRGyJBptVi5ErDIzpeCd6AyY6avnUW1zI4hvs2wsJUnCFAS1nQ7/ebik7N1PNWYS54j
	UCPPplyMRPzgKmBS62lFWLgvVNXyxm6Zxo/7xWalo2myJ/r6aejO2tSKzhZWPOIP5QhJHo7Svln
	QmYxDFEkRa64VdxAnvujWg7VR5dDfZEDJFBQBxQErLwR9oDEAQfRDndiMtz2RrqtfuqaZDrLyTl
	4ljIHXvzFVRRNCwNHkgSRUzHfc5qWUmN4uWfvKMLkNjYjELYx29qzJINLTahYHM9FipURd5OmYL
	w0rM0E2CD1f1QrycZrnroUYqZZTWNulaEyDcBa0x0rEgnLL0N45hDm0/0WFprm/4Bn+pUOrkUoJ
	3mHnd8A419lcaIvJndKf1m+e2JRrw9lETBoFQ/CO1XD80+wqtK9UycjbHbLGvMm428Il+/+rtVE
	PLRc/jUI16dOQ==
X-Received: by 2002:a17:90a:d647:b0:36d:9e0b:3801 with SMTP id 98e67ed59e1d1-3931e04a995mr206514a91.8.1786559033378;
        Wed, 12 Aug 2026 11:23:53 -0700 (PDT)
Received: from localhost.localdomain ([64.186.250.142])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31cf3c08163sm12127695eec.7.2026.08.12.11.23.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 12 Aug 2026 11:23:53 -0700 (PDT)
From: Chen Miao <chenmiao.ku@gmail.com>
To: corbet@lwn.net,
	alexs@kernel.org,
	si.yanteng@linux.dev,
	skhan@linuxfoundation.org,
	dzm91@hust.edu.cn,
	mchehab@kernel.org,
	wy@wyuan.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Miao <chenmiao.ku@gmail.com>
Subject: [PATCH v3 6/6] docs/zh_CN: how-to: document case-sensitive APFS setup
Date: Thu, 13 Aug 2026 02:23:23 +0800
Message-ID: <20260812182327.53694-7-chenmiao.ku@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260812182327.53694-1-chenmiao.ku@gmail.com>
References: <20260812182327.53694-1-chenmiao.ku@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The APFS volume used by macOS is case-insensitive by default, while the
kernel tree contains file names that differ only in case. Document the
diskutil commands needed to identify the APFS container and add a
case-sensitive volume before cloning the tree.

Signed-off-by: Chen Miao <chenmiao.ku@gmail.com>
---
 Documentation/translations/zh_CN/how-to.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/translations/zh_CN/how-to.rst b/Documentation/translations/zh_CN/how-to.rst
index 9ec2384e1..e1d3d2b8b 100644
--- a/Documentation/translations/zh_CN/how-to.rst
+++ b/Documentation/translations/zh_CN/how-to.rst
@@ -102,6 +102,14 @@ Linux 发行版和简单地使用 Linux 命令行，那么可以迅速开始了
 开头的命令。**请注意**，最新版本 Sphinx 的文档编译速度有极大提升，强烈建议
 您通过 pip/pypi 安装最新版本 Sphinx。
 
+macOS 默认使用不区分文件名大小写的 APFS 卷，而内核源码树中存在仅大小写
+不同的文件。在执行 ``git clone`` 前，可在现有 APFS 容器中创建一个额外的大小写
+敏感卷（先用 ``diskutil apfs list`` 找到容器标识符，并将下面的 ``diskX`` 替换为该标识符）::
+
+	diskutil apfs addVolume diskX APFSX Linux
+
+然后将内核源码克隆到新卷中。
+
 如果您处于一个多用户环境中，为了避免对其他人造成影响，建议您配置单用户
 sphinx 虚拟环境，即只需要执行::
 
-- 
2.50.1 (Apple Git-155)

