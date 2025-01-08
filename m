Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465C01AB505
	for <linux-doc@vger.kernel.org>; Wed,  8 Jan 2025 21:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736373595; cv=none; b=U5YuHX8kh1davNS5bF7WGpa2Yk4Qb7ZPDeHeWx+e4RbMlyo0EZ0PMFVKbB556/aOkLm1sJDl9gPl//sL31WIyUTgZCrBIvJ0JmYEU5sLK77LebdEUejGOL1oiqhKjGrAI4keWbFZi3jWfmucZskZD9RAWtUw50cblRiExgiueBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736373595; c=relaxed/simple;
	bh=G6ULTlj/65TlbTR2+r+b6sBB2Q4ZUG2NaXECvuivGC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hOY5DZeDUydP/Ku2lwph9dXmBAPtGguRhIWEyLhlCwpJ/GELNt20zhmfIqFQGIydpBdOtlxKxpPv4RhMCp4fRj2e9HD1QrCzwaHqghgDN9eSkg5Q9dzaoRm+juQfPsQfW5NjI2kPxt/RGMdSjRu88QarmauyQGpAnKeCf03tuOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t9NbJdWl; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t9NbJdWl"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-219f6ca9a81so11945ad.1
        for <linux-doc@vger.kernel.org>; Wed, 08 Jan 2025 13:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736373593; x=1736978393; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1iLf1rWe8AwDYp3OI251+FCsND1Ellapftv0xf64nYQ=;
        b=t9NbJdWliBP/5R3goMf9fh+EhGTkS3Q/HTogSCu6cpwA1QxR/6iRtiOjCPin5ccNIY
         j+kHj2RyW7FbzOIgp36B9dZGd0KJYBtfnsx9s+OmA0E//pVd3iQ3ISYwkk4c9tGmptXw
         WmoXlJTH/B+z8k9l3vb0mGo84YL7EWuItFa161SliEzo/HRBzZfTndvbn3V0wHDbB2Ic
         ABWHa20H+J2wJiu+jtxe4tCeS47yFesyd7Z9kt74lykpmrCFz8xNwXPJkkNufhunnKYu
         0k2fuj+qXfnrjk08biTEz9/iGELEKOKM/9RR1kgNAzEvOIn1Xhi8ZnJY73Puz+n7H0vq
         VMJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736373593; x=1736978393;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1iLf1rWe8AwDYp3OI251+FCsND1Ellapftv0xf64nYQ=;
        b=Md1jgUQuH7enbFcwk0WCGj/5gXn6RAJhhSJsYgw2JoX5eKaC02bZeJNxxf90UqcdDq
         2ST5nuGBOJkeCUo5KWJbXe0XsiNy9IvoKwYpGQkzExhEav1u6dciVw3P7dArgKrCXIbs
         GE55b2awQ/PIIq8txI3BGRv3y/YjxSThHaAK6R2aHIom8dfc1J8iNn9Eni2wSb65M1zB
         mn3I9htyjt2OZhYSykHzuvgeYWPCpnA9oNEBrGZb8fV7gERR9tCXaEjkxKNcHAAJ8TWS
         mTWI2tK7RNdtJMl98hNh1vsHgpLr0W0aKjO67q+2G5m0DZ1l57WOeNks5r0L3pJVSZ4q
         POGA==
X-Forwarded-Encrypted: i=1; AJvYcCWdt7Q65NHVfOgWZpKZ8N1235/GuEzDr/TK0aGpIz1Xsc8yBaqRRehhPkfwjc3QCnW2j5rTKUNbr1o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVykk5SpMv5yKiBmiNZgXCcwjC674BWwR65pchT5wYw3U7yfij
	1SUPS5lq87hSHSKwIVEBTlvovsSJTdRoH1M4v5Cztb7DybW3AeQXb/uSJ/+FqQ==
X-Gm-Gg: ASbGncv/bYEXOUwWwxRT02C5KZGUuY2fyIw/nEELj17HTniLaJ1KIixsMUx0sKHz4V+
	ZjVaO+nnOHYMYa7gbECAQuJ/smFnohG6eDMLZx3jw8IBV5V7X8N5UcNJBFNysP6bMvnOG1zcgaU
	KVbPx4ElICAh4J6DhzV/+SNXBiJR00fIG4li4xRGl00o3JZkp6fh1OgZrYmpWEKwRsX+Anv1QF9
	1930COK0AokcdQhQAcs4Guf2c7AiLTWrWlJ3w7u0XhJgv5xvBh9avQmBOm3zlRTgXVdy+gl5gF3
	PDoKutpuuMm4ZAUlDhU=
X-Google-Smtp-Source: AGHT+IEiqfBGQ3dVy88LHEcmGYgx+u1E3hQ+kbFS0HeWFSnmdf/rZBZQtJsXTXJS/5KxcgrxRxDdyg==
X-Received: by 2002:a17:903:178f:b0:20c:f3cf:50e9 with SMTP id d9443c01a7336-21a8ea0ea61mr607705ad.4.1736373593411;
        Wed, 08 Jan 2025 13:59:53 -0800 (PST)
Received: from google.com (57.145.233.35.bc.googleusercontent.com. [35.233.145.57])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f54a2ad2e4sm2090422a91.28.2025.01.08.13.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 13:59:52 -0800 (PST)
Date: Wed, 8 Jan 2025 21:59:49 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Li Li <dualli@chromium.org>
Cc: dualli@google.com, corbet@lwn.net, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	donald.hunter@gmail.com, gregkh@linuxfoundation.org,
	arve@android.com, tkjos@android.com, maco@android.com,
	joel@joelfernandes.org, brauner@kernel.org, surenb@google.com,
	arnd@arndb.de, masahiroy@kernel.org, bagasdotme@gmail.com,
	horms@kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, netdev@vger.kernel.org,
	hridya@google.com, smoreland@google.com, kernel-team@android.com
Subject: Re: [PATCH v11 2/2] binder: report txn errors via generic netlink
Message-ID: <Z371VdHmZ3FVdrEI@google.com>
References: <20241218203740.4081865-1-dualli@chromium.org>
 <20241218203740.4081865-3-dualli@chromium.org>
 <Z32cpF4tkP5hUbgv@google.com>
 <Z32fhN6yq673YwmO@google.com>
 <CANBPYPi6O827JiJjEhL_QUztNXHSZA9iVSyzuXPNNgZdOzGk=Q@mail.gmail.com>
 <Z37NALuyABWOYJUj@google.com>
 <CANBPYPhEKuxZobTVTGj-BOpKEK+XXv-_C-BuekJDB2CerUn3LA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANBPYPhEKuxZobTVTGj-BOpKEK+XXv-_C-BuekJDB2CerUn3LA@mail.gmail.com>

On Wed, Jan 08, 2025 at 11:56:35AM -0800, Li Li wrote:
> This is a valid concern. Adding GENL_ADMIN_PERM should be enough to solve it.

Right! That seems to ask the genl stack to check for CAP_NET_ADMIN:

  if ((op.flags & GENL_ADMIN_PERM) &&
      !netlink_capable(skb, CAP_NET_ADMIN))
          return -EPERM;

... which is a much better option and we could drop the portid check to
validate permissions. Something like the following (untested)?

diff --git a/Documentation/netlink/specs/binder.yaml b/Documentation/netlink/specs/binder.yaml
index 23f26c83a7c9..a0ef31cba666 100644
--- a/Documentation/netlink/specs/binder.yaml
+++ b/Documentation/netlink/specs/binder.yaml
@@ -81,6 +81,7 @@ operations:
       name: report-setup
       doc: Set flags from user space.
       attribute-set: cmd
+      flags: [ admin-perm ]

       do:
         request: &params
diff --git a/drivers/android/binder.c b/drivers/android/binder.c
index 536be42c531e..f6791f5f231a 100644
--- a/drivers/android/binder.c
+++ b/drivers/android/binder.c
@@ -6500,13 +6500,6 @@ int binder_nl_report_setup_doit(struct sk_buff *skb, struct genl_info *info)
 	pid = nla_get_u32(info->attrs[BINDER_A_CMD_PID]);
 	flags = nla_get_u32(info->attrs[BINDER_A_CMD_FLAGS]);

-	if (context->report_portid && context->report_portid != portid) {
-		NL_SET_ERR_MSG_FMT(info->extack,
-				   "No permission to set flags from %d",
-				   portid);
-		return -EPERM;
-	}
-
	if (!pid) {
		/* Set the global flags for the whole binder context */
		context->report_flags = flags;
diff --git a/drivers/android/binder_netlink.c b/drivers/android/binder_netlink.c
index ea008f4f3635..6b3d93ff7c5d 100644
--- a/drivers/android/binder_netlink.c
+++ b/drivers/android/binder_netlink.c
@@ -24,7 +24,7 @@ static const struct genl_split_ops binder_nl_ops[] = {
 		.doit		= binder_nl_report_setup_doit,
 		.policy		= binder_report_setup_nl_policy,
 		.maxattr	= BINDER_A_CMD_FLAGS,
-		.flags		= GENL_CMD_CAP_DO,
+		.flags		= GENL_ADMIN_PERM | GENL_CMD_CAP_DO,
 	},
 };
