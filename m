Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7CB3EC6B2
	for <linux-doc@vger.kernel.org>; Fri, 14 Aug 2026 21:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786743889; cv=none; b=FcUH24NiKWsYVlxtush/3p0Tb5W3TDm2VH7AbFq0mg6GILQ8zQHvoDb7iRj9S6t7CgT+AMglIiug9jng6b7M07qLbByj68D70XnLIpaMvKW+seLPGGhc8T9ZJO1VGxkHtRxEb8U/Km91iDt/3yyG0thjZ0dGCW8dXOEeVuqawCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786743889; c=relaxed/simple;
	bh=enQ1phiqyNZfnRKkkwTpsu1ywn5VcWK5YpQmBDqD2ao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W2NyuVpO2Y6OpFt7T7lXKHkLFKIc4SAbm8xsw0VDIL/fzJTGjR66/sKTTpHPMA//iC6d+dxFIvjAZkPQcM8QWiUinJBe8x9vVlOW/xZ1jTFk6onksWCoEPaOiJ9ty0EZq5z7qDCkTGexBxYJYMqG9OD0DJnMVvTzUXetxV+rCvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cB3aN48o; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cB3aN48o"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d049069377so16418825ad.0
        for <linux-doc@vger.kernel.org>; Fri, 14 Aug 2026 14:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786743885; x=1787348685; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oEv+Se2gHn9GJtitJ1A6lizvRqVoiP8jcMPlwHRZirs=;
        b=cB3aN48ow6EvJ7B29ua3cHNA/a5Kr7zEyewrvdU+CgymqiXri0er7TN4dYCkcqQnFu
         rbGakpoZkAMxn929SftU1rk58vaMFiOhAxLsxs9Mc7mT4uVZYjnS3PPoc6Pg2PJCnSG2
         WZ1ZltqzrludgW9TRE/rBJ+mCfhC0FKQ6WiskXnHrPGwfBXiRzqduSlgHsMEQVLdSGMZ
         ttxZpAwNBu7UuuBC57ZQiaQligfverSCGeC6/YSHN+2wDiYDenqsvucPVLrKLZJFsqB5
         D5f3rYgJnZf0ZyIpR3TIK7o9NA3VwLr3NrawCEI91E6Qq2UzUFbLgG5rnKQD3vLlgu8M
         CrUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786743885; x=1787348685;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oEv+Se2gHn9GJtitJ1A6lizvRqVoiP8jcMPlwHRZirs=;
        b=RdBu0kxK2b8eHuQjk1cWDucF8kj5ltajbjd0WeS++6BPoZEyxUIH9yk1QGbFTZ4dAB
         UIZ6cau6MFIotZArqt7tmDRRWlrRdJqZZZBYTOqg6hBfLiit+mzRGpqHFRvdaReOYm4C
         p/spQF23Lw1HQlhgt7f26RQBiW20hl5x3wFlICTbRoxoHOTKwiG8JqJ3tAWOTWRRfXxk
         DdzgC6VXmpxZ6Qv6YXW0mkKbDsXNBlCM6XmBgbV0eVNLzXBj2qIk9je2FZAI2Z6VxJWG
         V5fHbM4QrI4rrMXCZrW5euOnzqBjYxj1255ppZnpngIt3iFFKOUSim2VVae4H1MfnLHl
         SANw==
X-Gm-Message-State: AOJu0YzVkQVLUyqC6J0MtlN3RlCwY1ScxS7iCa0Ox4waxr7rTwRXHnNG
	vvvjTmTEw5uu/e96M14cEVh7Hjl/cHSzNJolw9uEdRJdSVpBnwy9FfWk
X-Gm-Gg: AR+sD12U07hMwKeFLUY8flgn1oKjVb9nzlXyZGQrVEVWdljCNFXeSTa13KPwmATSMER
	DqG+mytsDj8Jkx6fffX5Ov0ZnuIceW4VsOykS+qxfkArsaljpnrVrUafmz6HpYITpfAG+xnykpj
	Q2PMaIUaGSIDiCaqgKA2V09Pb2vshOFrcxQFmJ0hNYiUn1lnxCpGi/sOt9ALGOUY0vMy1ixc3gM
	3/rA1YJNjn7kVo9MdHBgnmJxyfgaEmOl7Mz5v3bX6QN+G+Glju6OBOtA9yqPMC8uYFr+hNcp/2k
	VNgL4Ez+QzVjQhidFjQtjniAmSA5Mp0NEZDq9Fl9+4cVNhPaDsAhHpi9xApwO5WhPdhNr46RNmC
	+D9RCRqNo2HnDw3ZIR9fnVlQe4S8sgwh2eQKQpJRPIBpMJSFhzynmR36sDWbPUWxPymH1MkHWSQ
	PDX4CytOcy+akpzdjEnhWwqN9i/w+RFvTPwfuwD0uZM3JmUemSU+HaJYPj8uxOr7vAmhMIdhI6b
	lk=
X-Received: by 2002:a05:6a21:10e:b0:3bf:7994:ddca with SMTP id adf61e73a8af0-3cc71d5074cmr10967453637.29.1786743884911;
        Fri, 14 Aug 2026 14:44:44 -0700 (PDT)
Received: from localhost.localdomain ([64.186.250.142])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d5bd918fsm8083617eec.2.2026.08.14.14.44.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 14 Aug 2026 14:44:44 -0700 (PDT)
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
Subject: [PATCH v4 6/6] docs/zh_CN: how-to: document case-sensitive APFS setup
Date: Sat, 15 Aug 2026 05:44:18 +0800
Message-ID: <20260814214419.49925-7-chenmiao.ku@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260814214419.49925-1-chenmiao.ku@gmail.com>
References: <20260814214419.49925-1-chenmiao.ku@gmail.com>
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
Acked-by: Weijie Yuan <wy@wyuan.org>
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

