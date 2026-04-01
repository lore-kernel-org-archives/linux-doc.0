Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFE33F8E0D
	for <linux-doc@vger.kernel.org>; Wed,  1 Apr 2026 14:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775052760; cv=none; b=NOeh+TzH8u00biU3K2iTxvaX8qhqhNnIgyL7DQvGE5M+GctzIpSQSWSziWgCl8IkiNZVXmk+Cd6qTZEfwN3vhgQ+2bem+wP3sV6V1JK7ZPGNryD2zsHWmi0qO3MALfK69EUCaoL8e8luN/DryY0BHWNI4ZVXsQk4EBwFOLBHXOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775052760; c=relaxed/simple;
	bh=U/YZYCdJdErSHcRekwUjajXy8oqLb8LTTrPIwT78mNY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X4T45SMbgpSGb0Y5MxLHvAvUvxgBDh2AULRqLOQlFx9ZZhHZKzvi6rHdFB6W/V4srJBlMj51gEETd2TvGN9iwccpjwthHJqQkhrDirbWOjv4ajBOYU9Y2iP7DMjbSr2uZAImZQ6cymKTPDQEwUnH4HB+32vs5FhBDL6KE+Z2XiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gnoQPEdm; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gnoQPEdm"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-66a4c6bb6ecso12444981a12.1
        for <linux-doc@vger.kernel.org>; Wed, 01 Apr 2026 07:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775052758; x=1775657558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h4en5LGOIs0OvtkFM82+97oSJ4N4qfuNIREFQq5UfjM=;
        b=gnoQPEdmkIhDSCAd7GDQnebga2Sp28jPDrWb7sPFMtWZxlS1WfQyOza3q7xzb4H/rJ
         BiOoGCXnOZoNgmfAikyLvlLmhvak7y5OfULFuWSJMOKAHOdzUr0oy2LoZMg/O1x/wSYm
         KMmhuc0sz/DOx9CqxNOxxkPpxCbXVmCO4lkWu3b3bamMfbYVTk3FHDJquDAVxk6F8Fi6
         OlwPkX/1+OIOlCFgoOXbQEegpvgd757dH7zCbdSfK3ozxn34VWAozeIgiNgk9wt5CLUo
         AvnV9xwuYUdLPatmZKODLW7cFtX4V53LyOy7DNRvZdgk/Ul8Brbuuel34k9k6k1Cztv5
         guLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775052758; x=1775657558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h4en5LGOIs0OvtkFM82+97oSJ4N4qfuNIREFQq5UfjM=;
        b=U/P0C5zjQEyX9ME4hqdzwpzgyUO3NDIpZhKMfY6losVQDJDh5lBfk0asFvCxhyh/OF
         Ptmd4XKAjExFeUDQozRevJ4iIGIwKSk3bcicFGIWkvpK9ZjxGZLt7UlqEOYttwgMiP7P
         qXCxlHLJe+IpL8Q1IxGEFU2p7+D5xoH0LHj10N0SSEidCFGCJMygGCwAr1kMqB/HMT79
         lOK20jFA4ZQsc4vzuCnNLylSd0qxPH8opTOhgznuUKJssEK4AKUqTt+CXHdBCscLAJSj
         GBMNtIEJ7Zee+PRnyFJ2UPQMdk63Rxi0QGpPz5z3FyoGyAf8BMZt8ytjIa2VHiePSCSZ
         2Esw==
X-Gm-Message-State: AOJu0Yyw8KlO3cEr13TvW0l1mLAl8gdgjQvHCkyyspcHyChwFbYLlzxa
	TPZhOo461+PBdilehkB/d1cZMya8sliOSDXDlHkaAhthPcMEc8RL2ek0MkjDEFgifHHfbMc1
X-Gm-Gg: ATEYQzx40HHsjniuYbw1PXHWMsBPde+2fgU//ITDFzyIJRFgCW3tDlrAT9G0wLToWqD
	P/WZhRt62kVIvjRVwkCmfgcmKgultOtXqGJCjpQPiecMIG+DqV/Ep7eLn2FEm+9/8iLuHsYjkSW
	c3oozoiaSUvMd8vrBC4TZY2p4UepN9nILanWrsBVlsxi+kQZ/wzJRVxOU2IsB35biS+91lvJ22G
	VQm9IMdxV7SeMpO6X4ULzWQ4JiVlWBgTVTNOyNqatPUX4yHKDX31QLYvTg5yG+UDsvJx///CjBV
	t82S/8VmP3bmuetGX5BEjmZa88A0HMkLo8TmhxbVY7PXbHmb/D4YQkc11N9QwY2f2MbpALa+vNg
	ivcI8+UuKXruwZKvy8BkZ952NP4sU+gLPYCCUQqkZUar0EBS3fYVxNSeCpMzLYlfM3MKH24m0KM
	yWUAHn
X-Received: by 2002:a17:907:7b81:b0:b87:7485:b4a8 with SMTP id a640c23a62f3a-b9c133a10e2mr245833966b.0.1775052757432;
        Wed, 01 Apr 2026 07:12:37 -0700 (PDT)
Received: from computer3.. ([2a00:7c80:0:3b3::14])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae51ef5sm518060766b.18.2026.04.01.07.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 07:12:36 -0700 (PDT)
From: George Jones <gjones.dev@gmail.com>
To: linux-doc@vger.kernel.org
Cc: George Jones <gjones.dev@gmail.com>
Subject: [PATCH] doc: clarify wording for ntrig sensor disconnect behavior
Date: Wed,  1 Apr 2026 15:12:09 +0100
Message-ID: <20260401141212.23955-3-gjones.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260401141212.23955-1-gjones.dev@gmail.com>
References: <20260401141212.23955-1-gjones.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: George Jones <gjones.dev@gmail.com>
---
 Documentation/input/devices/ntrig.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/input/devices/ntrig.rst b/Documentation/input/devices/ntrig.rst
index 1559f53495cb..cba4803ade8d 100644
--- a/Documentation/input/devices/ntrig.rst
+++ b/Documentation/input/devices/ntrig.rst
@@ -41,7 +41,7 @@ The following parameters are used to configure filters to reduce noise:
 
 When the last finger is removed from the device, it sends a number of empty
 frames.  By holding off on deactivation for a few frames we can tolerate false
-erroneous disconnects, where the sensor may mistakenly not detect a finger that
+erroneous disconnects, where the sensor may fail to detect a finger that
 is still present.  Thus deactivate_slack addresses problems where a users might
 see breaks in lines during drawing, or drop an object during a long drag.
 
-- 
2.43.0

