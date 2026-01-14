Received: from mail-oa1-f67.google.com (mail-oa1-f67.google.com [209.85.160.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FD72F3624
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 01:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768355956; cv=none; b=X3crBWkKH38p9243Up2+8vibLZJrorNgUKBtbuSH4dmsdS7md08zNzrXwK/YwyywYVTY0XT6q78genLKj1cEzZnrN62FApUxjDtvSVaCBhX/DtzRxXZhusbt8tgwDFuuHduU1Coelgq8edLm7bmQdLuPcAW4pa113LmkXoi0GbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768355956; c=relaxed/simple;
	bh=sDWD1uGFDDRlfxhy01ddUztM6UdtdQV0shZVeb+54EY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EZ+WCExxTrBNAnZBGXKRHk3NFG/MvpMcuVNzHPXVrcxIjimQxUWymD0Sb4rtWeY78quTqT4G0gs0KHDvbGEX7HfMeRdyhyuT6JA5Qd49aKkUclhpuArQuOTmSogWlBRMSMc2b5tPQnIPW78720TxorBNXW7VDLCxmxXUoDnRwvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TbZVy1qB; arc=none smtp.client-ip=209.85.160.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TbZVy1qB"
Received: by mail-oa1-f67.google.com with SMTP id 586e51a60fabf-3ec6c10a295so3646291fac.0
        for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 17:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768355952; x=1768960752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pKljsU8Xmw+/foisR3SYsx7mqK9N8s1wNDUiE0Eb/VY=;
        b=TbZVy1qBrLW2UvMad4FXwFwloPilP+ad6+gRn9Fk+SVRNS6Rd371xt65drwSoNcVQ+
         OjMrYdBoYik/f7JeloiaYn1H5J9ivzdzdY0QXPILO6YOYDLePF4C8p9JTWsDDuDj1wE4
         KEbMgFQ79ZChIDgU56+WA8hKzlbuxi3UZlIHOEnepjq68FVCqQRkArUj0NjFAFaPDm09
         PnIB+TrnnpVwdLMdierNp9Z8aWUy4hbcKD0NUsyxsKBU2ejJWFtKG/uQ5I6w+pLiriIo
         sxZYVLOer22wb3pmE5eobqpGaPKZufyhFQX/yDHH0FuAaovASCJC/xsN4jsKryFaryU0
         blfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768355952; x=1768960752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pKljsU8Xmw+/foisR3SYsx7mqK9N8s1wNDUiE0Eb/VY=;
        b=JeOkRhZy567tZrpHsCyny+7T76cdKG8W29Oy4DMHC0emgD7XjhJv1ySOS6FuJJ+z8l
         u9oFSA0s/6edmymPFeslNfmSY7AqRQMsVdN2SONAgz3Rmg2J8aKEbU8wYwSdZrIMXn/D
         kZC/eCgTw1cjZo36+LtmjEPxNfCJ6ocqHLZW1iESjkp22EWGFKIwB/wVy/2pMQZMmtlp
         ST6Ow/080xRYWCURdNOaFBcu4rCO6J2yAVSiVnJ6h7Wmx6csv8NrV1raEPj2mGD6/E2O
         RUysWEYjpeHo6/qJXe1ye1WkEq8ozanATmd+s4LPZOwHzbaTqQ6wnBcxfg4w6TUZ+uGJ
         zYLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcXdOnh4qX8T3FRkfwqx+kcbkEsUO2P3hF7BlvHpXh23o8+LR8pcgK2PAMujOZHenNNs7UjC++srk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyuoIQYmYSsJQ8RCAIPensmfVaN+AoNM8JAGm62fiNtW0FSb54
	WDm/EMAdB0VltUK80uJ5xKDSLFYhbGmrbnlHBfexjNzLKZU49LfS1XaG
X-Gm-Gg: AY/fxX5FCXSCkmKjSi9vIZOmsW6Wxwpb2UfHU9bDndlOOY1XDhQz8o3oKpMTJi7G6Qp
	/d5yVHb0LTpQ1FgZAILRCAyi8utZDVYcm8kt2PbRfU659Nyuhv80YB/UB6P9K68ER++6HjDTo2Q
	UUyeF88RgzLEAjeTK5vnDnB/2yDueT/loMAVuf809UL5NlxcIVkp1v87USdnwMuQFx2WR6iZTci
	I2MDd25LXq41JR40yWqGMwVn0lU0Gh7zui95u3pYVtFrEsx/OGiIsqPwo65CY8wP7Dp1ZGFeH3L
	gmeffozgbOk5ofzFlXhzeHiwmqBUbbsaoStN1M0hgoRxK4jDfgrp/9drnKKDN86D9olMLa2u9Da
	1LS7UOhToGsFb4eufJLElDta0K6cjYIe71n6jj5kParq7/0tmh/FqGe3kogxxNdGtLuPazXH08j
	0e81iANfu+en15inA+CWRFVB1PE6Mg1usrCthb
X-Received: by 2002:a05:6820:168e:b0:65b:3c3b:699d with SMTP id 006d021491bc7-66102df2cb6mr449232eaf.64.1768355951696;
        Tue, 13 Jan 2026 17:59:11 -0800 (PST)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 006d021491bc7-65f48bbb3f1sm9740809eaf.4.2026.01.13.17.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 17:59:11 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org
Cc: Jim Cromie <jim.cromie@gmail.com>,
	Jason Baron <jbaron@akamai.com>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Louis Chauvet <louis.chauvet@bootlin.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Dave Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	Petr Mladek <pmladek@suse.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	Steven Rostedt <rostedt@goodmis.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>
Subject: [PATCH v8 07/31] dyndbg: make ddebug_class_param union members same size
Date: Tue, 13 Jan 2026 18:57:23 -0700
Message-ID: <20260114015815.1565725-8-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114015815.1565725-1-jim.cromie@gmail.com>
References: <20260114015815.1565725-1-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct ddebug_class_param keeps a ref to the state-storage of the
param; make both class-types use the same unsigned long storage type.

ISTM this is simpler and safer; it avoids an irrelevant difference,
and if 2 users somehow get class-type mixed up (or refer to the wrong
union member), at least they will both see the same value.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 2 +-
 lib/dynamic_debug.c           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 98a36e2f94b6..4b7c3b997657 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -103,7 +103,7 @@ struct _ddebug_info {
 struct ddebug_class_param {
 	union {
 		unsigned long *bits;
-		unsigned int *lvl;
+		unsigned long *lvl;
 	};
 	char flags[8];
 	const struct ddebug_class_map *map;
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index cb171088850c..d2ff203d0873 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -810,7 +810,7 @@ int param_get_dyndbg_classes(char *buffer, const struct kernel_param *kp)
 
 	case DD_CLASS_TYPE_LEVEL_NAMES:
 	case DD_CLASS_TYPE_LEVEL_NUM:
-		return scnprintf(buffer, PAGE_SIZE, "%d\n", *dcp->lvl);
+		return scnprintf(buffer, PAGE_SIZE, "%ld\n", *dcp->lvl);
 	default:
 		return -1;
 	}
-- 
2.52.0

