Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D68199D8
	for <linux-doc@vger.kernel.org>; Sat,  6 Jun 2026 17:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780767938; cv=none; b=Wj2u6mEODNMUSfqhgpuHI9ciwzl0DM2yBaezLP5a376DqJwkzKOoRBn7d3ijq/D2JWQk3gXTb8tldhZvjh7fFzIicVtMVtfIJamU4630IQguETRB1uM93buahPA8vTt3wUHL/qTJtgfkRgWexhTmYlPcApnRJ7KJ74PpvbWpbPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780767938; c=relaxed/simple;
	bh=GGSurrkRrVaBAAv0mDCXfnzvvVpJJkyj1u5L2qicQJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OWqte5SWSs9LIqbMblTXwBgNxG4n7iMbT4gGWkIO0+uR+4m9L0GwiHzEM0Y7xRDas2Kvv3Gfk+LPBFtaipOy/04ftYDFe9lArbDjTQ2r6TYzegyIuE5c/NX3hCfbMo06GD9NeQwkDa2ymzAjI9fkEoeza8dZQcmQQw3Rv/nkr0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rssy+w1j; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rssy+w1j"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-36b9ec98144so2222882a91.1
        for <linux-doc@vger.kernel.org>; Sat, 06 Jun 2026 10:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780767936; x=1781372736; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7vdYOcG1zbXs38rrfilNIDc0Eb6wx6T9J2haYHxstsE=;
        b=rssy+w1jsJllqB7zYTZYqtl2zldiyzN5d5GOui8YJ0BRK8MSxSFn+n3v5AV/sOXd+H
         nbjIYbCya0Vy5OlG67lZnkvypfVe3LuB9hG5r5NiKuUcqrVmha1ebqOAcit7vhBcmwzx
         3Nd9/zSSz1HiTMpmK7t2pijGBWjbzvvXrffDm4uovCbmMD8Y29Fz49xdM1kisSEgdQRK
         kSWwRwqcXEF9uyOkMbGSaJkRreBdcBaGUAbf0eTvlRs5cwXkayLwiZxosg4mTmTPt+OE
         xxVDwdToyFRY6/cIk5uwNossOBihFWcAHVLtgYAXUZFNvdcdarw04A+ry4c6LjxlygPs
         kG+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780767936; x=1781372736;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7vdYOcG1zbXs38rrfilNIDc0Eb6wx6T9J2haYHxstsE=;
        b=It3Ynocd1l8gporrPHdN2zxSkDeXO6CIs9p0eleVtpI6sY47UrMkwbiA0per1/B79H
         S3dkwi5BocVT7lPnRAwB2wcOHGubsN2Z9rCXhWYPRF4Lwp+pd4GkSIEekoeji+5M1kAY
         1mJvCZ2TYk6YjBnPExTuWylhGjO2qdvQPkVwXT7m9CmXi+BeO/o4n9a7WeQZnNf2UTP2
         Y7Ag/vI5pN5KwMygjjNQp/oIFv8mBc6IqLSmhrR4KnBrm2435yIMJ0vrwYm6i9R7m/jH
         40HjpUTV39ScVvWzq4CovbuPwlyfLnKeQvwiB4bAKAbYMvBQa/DCdXwciRB75JqPzc2O
         7Kxw==
X-Forwarded-Encrypted: i=1; AFNElJ8H3YSyClZePbyMWl8dtDiGudp1NHJ4IsCLgu8ha/OJ8JxYbFYWdXPyzqltbMrwsvSQJ+j6uu4nFTs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrN5QXYahc//b4/dtdvrO5kKb7s5fTqn57zjJvqbUsJI/Q4MbI
	kop7rxV2VjnEE2XSHQwrotcmzNKggGQCyvqOEMHjnGLPcNjjduTjBrq9
X-Gm-Gg: Acq92OHtqEcvJSSMEr8691jeIJOZAuMPKvjRLQsznzTsgmsSnXJxHC1SORh6uWxx+81
	fEvNZkQ0I067wXi/3/1u/LNZlEChS+mwqHMsfDMZlopxtAsc2K9zrFdkdIrMH8pO4Xnsagf3Y0z
	0cvwgRiBFLRcH0M8HgJMEflpDD8Fztm93z1tPo1iRdsB1VUA7wsz8o12yT0gRUG3docrf2sHIKY
	MWJtHKaeh3SpdEtfCDBk1xbOPn/I2iWUnOZ1Vd1ME2KHATrZBby0iX6LL9JIT+0FGvPhQaqnwEy
	ueAHrqKBS8aeK+gpV1Z8rcXa/NDodsuwrB5udYHtqYmDilx/hW1NxbcZpN+NuTJeX/OcI/KnyV1
	7sMRFLrW53+NJxOhW8yqyM4+4UmaYksEy+8vGIvF0jSXkTV7x/KU2ORsH6TYNa5qN3PAnevSsdy
	3X+REyh39DC/F15xG56U4A52UtL3GQnRDEvcBfNJ6cFyFrPyywv+KpCqSVYxK1r9JkU/seG9teK
	Jghnggg6rqwmdVf/pHd8JM=
X-Received: by 2002:a17:90b:3fd0:b0:36d:cf58:b79 with SMTP id 98e67ed59e1d1-370f0e4b14amr9357296a91.19.1780767935628;
        Sat, 06 Jun 2026 10:45:35 -0700 (PDT)
Received: from urbaner-laptop ([61.70.109.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6bf90a32sm12852338a91.1.2026.06.06.10.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 10:45:34 -0700 (PDT)
Date: Sun, 7 Jun 2026 01:45:30 +0800
From: Ko Han Chen <urbaner3@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Simon Horman <horms@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>, netdev@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Document: Fix missing reference pages
Message-ID: <aiRcum6gw3oa4wJU@urbaner-laptop>
References: <20260605084130.13363-1-urbaner3@gmail.com>
 <20260605171401.0586831d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="T8XblR0duSLm763K"
Content-Disposition: inline
In-Reply-To: <20260605171401.0586831d@kernel.org>


--T8XblR0duSLm763K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 05, 2026 at 05:14:01PM -0700, Jakub Kicinski wrote:
> On Fri,  5 Jun 2026 16:41:30 +0800 [Ko Han Chen] wrote:
> > Subject: [PATCH] Document: Fix missing reference pages
> > Date: Fri,  5 Jun 2026 16:41:30 +0800
> > X-Mailer: git-send-email 2.48.1
> > 
> > Today, my friend and I are discussing a wwan driver produced by
> > Mediatek. I am reading the related document and reference link,
> > then I found the page is missing. So after a short search I am
> > giving the better link and test the two pages with my bash
> > program for more dead links. It turns out only this one. I check
> > the page and the following documents. Details are covered in
> > this markdown [page](https://hackmd.io/@Urbaner/lk_patch_doc).
> 
> Nothing really wrong with your commit message, but the narrative
> format is quite unusual. Please rewrite it as if you were telling
> the code base what to do.
> 
> 	Correct the links to ... in ...
> 
> > Signed-off-by: [Ko Han Chen] <urbaner3@gmail.com>
> 
> And please remove the brackets around your name in the Author line and
> the Signed line.
Hi Jakub:

  Thanks for the advice. Updated the patch.

--T8XblR0duSLm763K
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename="0001-Document-Fix-missing-reference-pages.patch"

From 1c11e2d24116cb86ebba6ac1c8463d6efc59c70b Mon Sep 17 00:00:00 2001
From: Ko Han Chen <urbaner3@gmail.com>
Date: Sun, 7 Jun 2026 01:37:42 +0800
Subject: [PATCH] Document: Fix missing reference pages

Fix the first reference link in t7xx and iost pages because the site
reports the content is missing. Replaced it with a page offering the
right content. Tested and confirmed it was the only broken link.

Link: https://hackmd.io/@Urbaner/lk_patch_doc

Signed-off-by: Ko Han Chen <urbaner3@gmail.com>
---
 Documentation/networking/device_drivers/wwan/iosm.rst | 2 +-
 Documentation/networking/device_drivers/wwan/t7xx.rst | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/networking/device_drivers/wwan/iosm.rst b/Documentation/networking/device_drivers/wwan/iosm.rst
index 6f9e955af984..d28a922391ce 100644
--- a/Documentation/networking/device_drivers/wwan/iosm.rst
+++ b/Documentation/networking/device_drivers/wwan/iosm.rst
@@ -84,7 +84,7 @@ session 1.
 References
 ==========
 [1] "MBIM (Mobile Broadband Interface Model) Errata-1"
-      - https://www.usb.org/document-library/
+      - http://usb.org/document-library/mobile-broadband-interface-model-v10-errata-1-and-adopters-agreement
 
 [2] libmbim - "a glib-based library for talking to WWAN modems and
       devices which speak the Mobile Interface Broadband Model (MBIM)
diff --git a/Documentation/networking/device_drivers/wwan/t7xx.rst b/Documentation/networking/device_drivers/wwan/t7xx.rst
index e07de7700dfc..fd532a7e225a 100644
--- a/Documentation/networking/device_drivers/wwan/t7xx.rst
+++ b/Documentation/networking/device_drivers/wwan/t7xx.rst
@@ -187,7 +187,7 @@ References
 ==========
 [1] *MBIM (Mobile Broadband Interface Model) Errata-1*
 
-- https://www.usb.org/document-library/
+- http://usb.org/document-library/mobile-broadband-interface-model-v10-errata-1-and-adopters-agreement
 
 [2] *libmbim "a glib-based library for talking to WWAN modems and devices which
 speak the Mobile Interface Broadband Model (MBIM) protocol"*
-- 
2.48.1


--T8XblR0duSLm763K--
