Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EEE3FD137
	for <linux-doc@vger.kernel.org>; Mon, 10 Aug 2026 14:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786372417; cv=none; b=AzCOJNQJL85VxXcAgXod+5iiAR+AIELMipAKfqcFmK14o7wqbgjDnA/OkW4sFVUIi2jMe6poo1q++SQgOwU1Gd4RJv/46zYw8QgYsxQgiiSCYAaZFK/cZdwpce6x32OzDTT9Ztft+dyleUu6vRD4gksD9yqXiA+bj3kCE6qUfSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786372417; c=relaxed/simple;
	bh=Kb/hBUPy6b4e8bpaHqBmWRP1I4kTLY3QnVfF4XhM4Ho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rIjQezIFoPcPRUgxjvEI6juWwsrRnCom+Ktm7seIzubv9PKXwWwOR1yj9zUwsjBuyge/RsspYRdAmeMH9qOraEA96om6DzRJvJ1LVkqyVlCzERMxbz9Z5YurXKJBE32eQ4/FGqMCDJieNCZO0g/koBxohZXpT2VfRnSCvBfQdvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Odc9+Czu; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Odc9+Czu"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38f620399a0so1675080a91.2
        for <linux-doc@vger.kernel.org>; Mon, 10 Aug 2026 07:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786372415; x=1786977215; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Nks8VC3vHUBzywbcvluMteExgRFIxGN8FNe5HK/cCDk=;
        b=Odc9+CzuwJBhBObWPmOcmafPmzHBTu5LuAtHN/Vl/bqLGFhV3w5kIkhP7dANkMABKc
         BbbLwG4fOfeCqyvDm0aZAXGorMdi2TQggMC6mXOTXxpK0G7evicSuzyHFhPFaSuqJwn8
         zhwx/XkRt5RiemL7XnpO7rgwNEfD1GVgYqPvNlUikCI6osZ0+V8KHtFrjV3wsJ2GQgtz
         z3YhsBBaCJ7HE6c+qGq3WW5iYfB0ZSEQNktEKBLHCN8N2sfUEGXaDznojQT99AKOKY4w
         BE91iLkE0rdYH+swEtJzjqao0AHBk4E5yATyNGEpXZ89zFAuniU4MnLjq4n7zGnMAnQz
         +Pyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786372415; x=1786977215;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nks8VC3vHUBzywbcvluMteExgRFIxGN8FNe5HK/cCDk=;
        b=Vjj+CVFF4q+Wo1vmzwi9JL5CW/fkRWPPCuPk0Vs411waaE1KFAy/apGnOlBUmggOhH
         T/g8mFXSVULkiK0GzytaXN2mBGzTRAtevaXdFRdkPFBMAu3xI2EuV3kdQTM6bxfM/boZ
         uaO25mT9aax2sHaYXBj1w0JMKSphne2KRXj90PijqpGF70h+qgcpWCB8eGNrT4L6rQl7
         5oCjx2yTRpLZD40/YiAdSsA+obW2umItuclzwGs01yigXwOqERZ7VkqjXqFdj2V7hH8J
         1OXXdL8UMXSadju06bTIMIC9PNhjA1BZZYKlFNAJ9qJINNZtnyEcZuAbt4gIeuhvS82i
         t5MQ==
X-Gm-Message-State: AOJu0YzkhEeFgXieOZ7WWeb3dJ1T2zhV+YhZtaq0g4AwwPKDF0QN1ASE
	Cr50G3QnRrUsyQb2twaht/ii9yTFan238hyAHETK3exjoZ5VA59cRi0cdu3OIclT
X-Gm-Gg: AR+sD10YlaiM10L5Gi84zPDf1++C3rXKHX6WiqxmqxDHjIS/v9BLHm6/huZbBuw03/2
	GXyOEnVEVmDWaOg/JjUmHcFjyb0LlpcBmWcvke4MtUsykcSKEjOxHYWtH4uUVaC5yO+0keRXr6z
	yxb490Z12qWIxhT1KSCpZMa5LpGgp/pAsQCK9BJzMeCMQpqvuk9NgEORXnPB0YI2Fe50hyRWqWW
	8oZs6kyxQs7kC2aCenewMk7ajBGhkCHRjvLutc1Qi8tAoHZXV5h72fymepaC97//6IvtFo9VuHr
	2u9lOmayhBbcGh1qma2kAHDrhcwiM0znx15XwVMagBzx+gNyvTHvcS3e1kIonPKWJXRg43M5uQL
	oq4q+i25diAoXBhnJdtOq8o37JuMVQHHjxoR+fL2UCk5AfIT7vZvIB0nL41BrZJaiv0BU5p2rf0
	tIzHwfUxfyMQCimWWlJ+yaXkUmyfqyaDIBtJT4IiGH/iP70eqOnd2DW11pgQ5SXxFvq7FfnM6A8
	2g=
X-Received: by 2002:a17:90b:4e8d:b0:38d:ec31:4840 with SMTP id 98e67ed59e1d1-3903c5932femr46548870a91.13.1786372414681;
        Mon, 10 Aug 2026 07:33:34 -0700 (PDT)
Received: from localhost.localdomain ([64.186.250.142])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1410cc132c1sm22197001c88.8.2026.08.10.07.33.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 10 Aug 2026 07:33:34 -0700 (PDT)
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
Subject: [PATCH v2 5/5] docs/zh_CN: how-to: document case-sensitive APFS setup
Date: Mon, 10 Aug 2026 22:33:09 +0800
Message-ID: <20260810143311.57775-6-chenmiao.ku@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260810143311.57775-1-chenmiao.ku@gmail.com>
References: <20260810143311.57775-1-chenmiao.ku@gmail.com>
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

