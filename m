Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69463EAC6B
	for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 15:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773759649; cv=none; b=CEAXh30EtTCqSThVbQWm4PtyHlZI4ZpIThTHL7159ukIiG39ABhg0dZBheJeokvhk2pSHQLyHMoptVf/oxZKR2TRPvazto3yESmBRVyS2+tvMwhjgUWk4QKLga9ZsizBpSFLBGzTMyj8zXIiUHCqJBGmZvQQP1kTITm3W/1w7wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773759649; c=relaxed/simple;
	bh=y0cFwtPG/Cb2k4cmeeXcVJx5e1bEZ27UmXDXdyoJzSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aEiH2WDL8trCUdy7e2XUTRWQKgWzBGncKnGlTNxK2TqElg8S1Wq55dPdcfNa3j7r2xGkmEafdANgGdM7yAvyV5a4ncI2QyGslsTfLP1WYrsY3pJMmvK/YeP4/gQpDkhaRz88gLnkT3uTVmeuVbBW11Hb7VS7XNK1vM3CMoGHbFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hr1nu33x; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=MEDZNnKe; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hr1nu33x";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="MEDZNnKe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773759646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2ZjyvvzO6j/AYmpeb+MoccEZqlSVtgrWJzOGtOE/3fw=;
	b=hr1nu33xk/nzeBomTBlGd8Ln2VOkdBGNC5Bkj/98agRtsvHeaMUZLKEpB/eYV67hKEo+Qg
	TaKr7uizYBloIVPskvlLVto71oGV9c41H5G/ds6vDtTjYBe2SUINuDoO4bh9eLbMK8EgE7
	xPXpOIO49aXnj9LFmpiousB4ecA0/J4=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-175-b2swiN40MVm7ntp04I-CuQ-1; Tue, 17 Mar 2026 11:00:43 -0400
X-MC-Unique: b2swiN40MVm7ntp04I-CuQ-1
X-Mimecast-MFC-AGG-ID: b2swiN40MVm7ntp04I-CuQ_1773759642
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd77e5e187so3303100285a.1
        for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 08:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773759642; x=1774364442; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ZjyvvzO6j/AYmpeb+MoccEZqlSVtgrWJzOGtOE/3fw=;
        b=MEDZNnKexNX5Uz/OC0szVQwR2XKCQOoEb5nGJd/a/bi/mu+noZ7DrL9FY7z88UEIvX
         0KmueJDzBjQM3kcOnvUo4b6b8JqzYzRHfUmLoCKqNr423g9w2WzeL3q6KSvUSOiWqMdt
         VbAcZmKTiBMAUvL8sGa8cP66ZHmHd2NIxQbA+iZcbS+02nkWjkDiPhCrcDyqbEUQL2YB
         2lwjcnOZPWgrJjDRRpYPuEDo14UJQrUPDzfFadwhS8dg7rxPdOsz5anra55sylM8rLNs
         4Bi0thTy7aVmu0CVFZW3KtegfARbI/Jg89Pulmkn+DWftgskBcS55h8yEl6z3+lF/6fQ
         BT4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773759642; x=1774364442;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2ZjyvvzO6j/AYmpeb+MoccEZqlSVtgrWJzOGtOE/3fw=;
        b=TiN8kxqCQ+nR555ct+8x3f4yqd3p6maGPmu1wJH5e+1gQ7nm3BenvM2Z6XoNkQyZyE
         rsHBMjxVUU3vAVkqikvGB/GFyPeE6J029fXhtY8GSCDCOyuC5VTS8e2zwVWWQF4111b1
         bxCyUvIXk34C9P2nB+ddgjEaqtwohQSKfLLoT0SLdXBHUthvneBH5G6kekJaijBz3y8Z
         yoxrCKF9MFThNkBNe/EE8spzL/HXMcaTHCOL10FFUriYElM05vi7X1duoxapRFdQqtU1
         94UqziX19tbQh7H4qJzPhaeq9JHDjHffIzRqba0VMAYbSAD4wITPMBRa4vg/GULkbq2J
         QFYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVG8zkxm/QikbO8drOWMR6yUcvpQUvWvxeDwrkp4bfXiyGqjAjSlZrUmZf5LdqmBMr5W/E9cMiinE8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSoPQ8/HYjnkijlkO8nAFkUfCtkcGVrIRm8iNAqDRRjm60HNiT
	Y6GUcxAp6Y4uVID65iomfjbIlDRNfg3IFQBTpHvn9AA0VxQ24pKnLq/gJpiw71rjeZmfwafnDC7
	BWuULcrwKOiYug8HalWcvNYQY66UXFtHHK2h4WkC7v7W6SQziUaftdPNNh8JCmw==
X-Gm-Gg: ATEYQzz2i4jPg7GO2c8wQokp+zED2zHjJErvAkKxkVz0vMcXjdWnh9AdKZbFEaMo8VH
	5dcayF5Y4k/mOK+xmSFdus6OGU/8iG/yaQ4ElOUDQ68R8WaVPepWbgvC150FvfZPZs3vwQHIUSu
	75Rh4yb8WvLDCc2ULv0KKDwhgYWL8lTKL/Wo5QY3OvXOBwkB2ukjzp/ZhB8C05SfqJJ+8i/opsZ
	BxaK614LyJf6M0QvsXGt61/dMjGLeMpi8MKfh6S+2fE3g//f+boY6hyQO5bE2FnWQEd75SzYDKD
	XuTQOy1Zql+MOz8yzQ/EJddFx92Q+Ji0Spw7mk0RvEwFm7RiRqmkDys8mdG46+CBipk1hjUwIyt
	Q6QGdcLLsg1CGc/CWx0jXhIs02W3G79NZhvSWzYVRtC/iZOmfMnPiMLDi
X-Received: by 2002:a05:620a:1a25:b0:8cd:8cb8:6ff9 with SMTP id af79cd13be357-8cdb5a70fecmr2086628985a.34.1773759641498;
        Tue, 17 Mar 2026 08:00:41 -0700 (PDT)
X-Received: by 2002:a05:620a:1a25:b0:8cd:8cb8:6ff9 with SMTP id af79cd13be357-8cdb5a70fecmr2086616785a.34.1773759640773;
        Tue, 17 Mar 2026 08:00:40 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cda21484casm1462547685a.40.2026.03.17.08.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 08:00:39 -0700 (PDT)
Date: Tue, 17 Mar 2026 11:00:37 -0400
From: Brian Masney <bmasney@redhat.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Maxime Ripard <mripard@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: add new Kconfig to control default behavior of
 disabling unused clocks
Message-ID: <ablslaSoUraCRPKl@redhat.com>
References: <20260316-clk-ignore-unused-kconfig-v1-1-6e95a4fb0c94@redhat.com>
 <20260317-almond-leech-of-correction-2a2ef6@houat>
 <com5zf4bfgb3eoelbmy5pfykhdow6ne3nteua6l7bnzkr72dsb@pehxxygji5z2>
 <20260317-notorious-classic-sunfish-d016d5@houat>
 <2dsd7hq4bn25dibqk62a7o56tt2tecf645tq3upccneq4hby67@cmjjc5d6ximt>
 <ablhdKJgEhU8KmtO@redhat.com>
 <hdagvfcxoh4nukz5sqocbp7qbezv3rxct3aygb7fvhsej7zp27@iyeoi74q2w7n>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <hdagvfcxoh4nukz5sqocbp7qbezv3rxct3aygb7fvhsej7zp27@iyeoi74q2w7n>
User-Agent: Mutt/2.3.0 (2026-01-25)

On Tue, Mar 17, 2026 at 04:20:06PM +0200, Abel Vesa wrote:
> On 26-03-17 10:13:08, Brian Masney wrote:
> > FWIW, the only reason I posted this patch is because at the end of
> > Stephen's LPC talk I got the impression that this was also an acceptable
> > change. I'm fine with dropping this change.
> 
> Here is the scenario that proves adding such config isn't the right
> solution: think of single kernel image working with different SoCs from
> different vendors. This is actually the case where distros need to have
> a way to provide one kernel image + thousands of DTBs and be able to
> boot one each one of the boards. Whatever this config is set to in the
> kernel image, it will not work with all platforms.

Agreed.

However, with or without this new Kconfig, we have this problem today.
Right now the kernel isn't bootable on large numbers of systems, and
people have to manually add clk_ignore_unused.

I agree though that we don't want to penalize boards that are doing
things right, and have a full clock tree described with higher power
draw. 

As a test, on my Thinkpad x13s (sc8280xp) clk_disable_unused on Fedora
43 turns off 96 clocks on this laptop! I can infer what some of the
clocks do based on their names, however I'm not in Qualcomm, and some
of these clocks I'm not entire sure which ones would need
CLK_IGNORE_UNUSED. I got it down to a set of 7 possible clocks that
may need that flag by excluding some classes of clocks, such as usb.

Brian

