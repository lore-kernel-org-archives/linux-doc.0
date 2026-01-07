Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A07315777
	for <linux-doc@vger.kernel.org>; Wed,  7 Jan 2026 12:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767788534; cv=none; b=IzJ1k/hmNrgoG7synzcdWOMmEMop+1cB4D1cJQgkt1CJzlP6q+84gr6DVJQD+MdhVQqPDwkfNMJboO+YJWqS4ohJVsooy8Vstx1vGQ+Ym7GGgxt/L+AzNzGx3L3PyXsCFp7U6IVM0JuFCLOLDEWVmzz5Xa/LV1gCKi1UtcFQ4ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767788534; c=relaxed/simple;
	bh=VD/I6jUGFgvjrGJZ+tE5eb0QESIrVHY+p2VGpXV7rxg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IASa6BkfQrvq+6ihotmDoE8wUOWuCaDROTUwY2RNLENEOI0NiY1FEpXxxBrYiIQ+eZXw2E4t4RU0QcoiWfvwdhI3JOg+Dxn1K5cqPAxMHebHPqFY/5WtPTAX1wed+eb07fd2+mOwPlzp7gJ5lqvWyjQz9AAh4URHODCAJCDv4mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Di6fI6vY; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Di6fI6vY"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4775ae77516so21972645e9.1
        for <linux-doc@vger.kernel.org>; Wed, 07 Jan 2026 04:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767788531; x=1768393331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xzb1wps8eSWw14l0JHoJa6h2SAn50b1lPYHmOdQkBEE=;
        b=Di6fI6vYHeUvNACELXqdoD5OomA+AzqAiCjiRbUq2NZjZFA0zIf+6N6PTaHFxAsAxi
         NNL85Wsz12eyKJcM66JAnJphQ/9aTUgFw/xhkAGIYu1tNhTDe06H5M7hEbXw51fG3ueD
         HmTbVSGYRFCUbCS4tNC2tHlJJHCwDT6hsO7tBrAxnYO8wJ2YQapn2YXEW3GDajoxK6lU
         EeNXpgHppWPhDksWRy+C4oqPVr5fC9ELbkKn7M7cQDwMhK3FxVOKNpw+X6tJzSSi/JvE
         /KOkDjn2RtBtRxZLBsukOKUUHwkQw+s86PMv1pqBjl4Wy0XoqzMq6uO/AjORia8fyFWw
         5v8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767788531; x=1768393331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xzb1wps8eSWw14l0JHoJa6h2SAn50b1lPYHmOdQkBEE=;
        b=BTeKxIBDIQ+tmXzTpuAyr98E2/5s1tn8eXijASVgE+zRgsqTdroqk0ZBYGHaR/O2SL
         hXxLy29wI8mOMkzLbUOzuJtIvYvO0VJ2TMslX6lufSsKPa83rxfIsbNjwCHE+EubeflA
         Bj+eGzxBYH/HojYcXYkq462Lfu8Iq9t3IaMh44DzYQLZKSEIiZn02EC9C1EJoYaKf4/l
         bCezxfLukP5f+TI4jARYeGEzBKrxWBSdXrF4bHGovkxNdnzri2aCYCCU/pQksIL1WWzr
         re8aIpFAU6XVGQYicBStqDoCuyGFaeibL976w+fDlheJcgiwsBsOaOXqLs5piZksdPZt
         e/gw==
X-Forwarded-Encrypted: i=1; AJvYcCUkcfd/YqwpgvWEof/k1L0pbBXhd4JrL4HYT0Vfz2msFP9MKmoIMw3rBPULpp194EBLrs53aJ8lMyA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdEKd4VhzeZmKrZSlWBRT0QqrEaX/cBisFjMnUKXcUmGoXh4iP
	3I8+JOHgRQrQCRzxCRbv8Ln1oBZluYqoLFvBEYphv1P6B55JT+ChnBJe
X-Gm-Gg: AY/fxX5hv83I7o27AxYideKIm/69nTtEyym1LFNJ20s1x0UeJGtKa8DfIsAlmIxxI6b
	6B8aV2F4WFt94f00S/ie/au8VTo0Mv8Sr8UqqG/xIxQTauaiLYq/uutNvWJ2iHGxrcP72zb+vWW
	HgFfwPyl8xaCZfh3Dxwyj+bgdU59Nn4fK7WXojLyZZnuGJ6z0vyY28lQa9Xl8s38MusjRUWMbHo
	EhCwgOP/+m0Nt7CDKOXKkWtN/+EVbUb0/KxNhq2CoMoTwL1CBU9TPQd0OCLYqWsf77efQlBbAj/
	5ma4i1gTKqhwpW8KgZidGCX269BFV3LKFVD2DkCrZoVHWib3E9J8sbz2mz2rMt6cCCQTXAaaF9C
	ZliFqGrxdtSuo045XtVxSydngUCZdSaVta4OEYrEdsDAZ8DvpGHy/X5sFutR+g7qjtUmSfzcwbo
	kh1872RB+lvjxJb+4vTFxvog4Z9KFK
X-Google-Smtp-Source: AGHT+IGih74c1OUYUEBMRCUnH6eJk6L653lrbOyGOFDnLNlorlBJ0fepCFsMQB0kJvgX782FfehePQ==
X-Received: by 2002:a05:600c:1e24:b0:477:5cc6:7e44 with SMTP id 5b1f17b1804b1-47d84b18ccfmr25536275e9.11.1767788530786;
        Wed, 07 Jan 2026 04:22:10 -0800 (PST)
Received: from imac.lan ([2a02:8010:60a0:0:bc70:fb0c:12b6:3a41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e16f4sm10417107f8f.11.2026.01.07.04.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 04:22:10 -0800 (PST)
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
Subject: [PATCH net-next v1 07/13] tools: ynl: fix logic errors reported by pylint
Date: Wed,  7 Jan 2026 12:21:37 +0000
Message-ID: <20260107122143.93810-8-donald.hunter@gmail.com>
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

Fix the following logic errors:

tools/net/ynl/pyynl/lib/nlspec.py:299:15: E1101: Instance of 'list' has no
'items' member (no-member)

tools/net/ynl/pyynl/lib/nlspec.py:580:22: E0606: Possibly using variable 'op'
before assignment (possibly-used-before-assignment)

Signed-off-by: Donald Hunter <donald.hunter@gmail.com>
---
 tools/net/ynl/pyynl/lib/nlspec.py | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/tools/net/ynl/pyynl/lib/nlspec.py b/tools/net/ynl/pyynl/lib/nlspec.py
index 5cc10e654ed6..987978e037ac 100644
--- a/tools/net/ynl/pyynl/lib/nlspec.py
+++ b/tools/net/ynl/pyynl/lib/nlspec.py
@@ -295,7 +295,7 @@ class SpecStruct(SpecElement):
         yield from self.members
 
     def items(self):
-        return self.members.items()
+        return self.members
 
 
 class SpecSubMessage(SpecElement):
@@ -570,12 +570,11 @@ class SpecFamily(SpecElement):
                 skip |= bool(exclude.match(elem['name']))
             if not skip:
                 op = self.new_operation(elem, req_val, rsp_val)
+                self.msgs[op.name] = op
 
             req_val = req_val_next
             rsp_val = rsp_val_next
 
-            self.msgs[op.name] = op
-
     def find_operation(self, name):
         """
         For a given operation name, find and return operation spec.
-- 
2.52.0

