Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670563C5523
	for <linux-doc@vger.kernel.org>; Fri,  5 Jun 2026 18:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780684613; cv=none; b=IG3gexhMWv3Bv8wi/FkrVgC2fbdiLmI3L/bdrnY1xTssVpJqcBpSWI7MNWmt0TYw8tX0rC/EE+3vzSdboPe9IlvqNZkUmKhQdRhd624h8e8JlGgDHdq/FLnPlVOcwKVGDUUqXKKQTWD2ErSWpqfpVOj20N2D5d94f0fyNRH9tj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780684613; c=relaxed/simple;
	bh=ZQHe0J07CmP23BW2U5EKlaB3TPIrDh2NZlEnsiDNxHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ow88WaZKWdEkH90pPkO4DtwZzGImvm/eFtNozcGWXik0gxN5MYiFYA6I9MfreA1fMWAK372ko+Xa01JuX2JWTKys2E+JmdF77GziiPrzkFC7+pR0VC4QMDlG29PjdV574H5xiYPVwrd4w/qIoJ3rIfkv+7W1TJ2ez3Lii/YfNaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JhzoTCFM; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JhzoTCFM"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2c0b1a48855so163305ad.0
        for <linux-doc@vger.kernel.org>; Fri, 05 Jun 2026 11:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780684612; x=1781289412; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P13RElyEY77N682sCtZ4HPH2+wcRcMGtUhEt/2n1PrE=;
        b=JhzoTCFMqXHlj+OgFZrURLYyzljpgP3EZYIYSLBDID6328qNmjfVX2VH4IHiDHMdVg
         ROI4J46S64WfxwgFofxjcEnnDEaZAy3CkWMnhVtvmn7moF/Laq/3+MMqwMX7j7HoZd2b
         YDrmuNyua90xwQX/UxjbfM9etutoVbvxP6xeN0I711ANdJWwzoV7q9nnhSqPZ3rExPjL
         XjKNvquz4GFoxa3A9fj4SKZPzhdY3xe/kKgeqBTDHZVN9t0jij8VQhvBi3Iy7NpynoL3
         LYdg0uh3XS6ZWBOAp4lyG06iBas7Z9oI3nhFAyelazgi9lUQ0hkA9aqAzjXpEOVmozm6
         Ua6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780684612; x=1781289412;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P13RElyEY77N682sCtZ4HPH2+wcRcMGtUhEt/2n1PrE=;
        b=gdhztea1BD7FgT7M0Lrm09rl4i4QrhQH6zDByb9pWfqbe19ZCuZpf9ptN8ExVd5oOS
         nXAR9bgGaItcRu3NgHMcgHnA4sAvtJZiRtdJzO7Ch220FGa223pB2j6Ii/s4tQIz8L68
         7DGvdMYMRR//GGdYLoQES0Z1h1m/FRmgJCBjhcF2kicCGx44lAqm6l5rbbSYHU16SEh+
         8KABx8vplo61sMpG4mLjnHfQyPCyA3Niy56aEpdW1wcX6iDCtojSr4lj8W9s8KAtLJH9
         j3OqbDOQkg30zNKEWcPvjFZtQRzuaEaeLEhTXdqtI9JgsHr7D1oHy+cSgtKKgdaliQLx
         knxw==
X-Forwarded-Encrypted: i=1; AFNElJ/V3biQZ3GrFVwcGOP0kS8/UP2ubGx3bdgtSNeA+e8Q81703QkL2ubyF6oxVS+qkh9oJLVfOL9oG9s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0grI1EEZZHLGL0VuAxwG3UpzbzpEAbbd9LNNScwcytwyns0xv
	91Y9RPY9xwYP1SuSXHWzYmQ9NFalT5WCE+jmCGpi46q3H6Pu5lPnDJw2K9zP4z3YCQ==
X-Gm-Gg: Acq92OEN328/fe8Yqy0n/3kPawdqHD+dM4JnreS8Qrut1dTGEuY219KQ88sYlkuL+y/
	gxA+vCEmsvCZh+nvtErFeJYW/VaVGjLOFUy8xnHDA28FZZuv9d6GAaQrIy7W2INmt4fsLG10i3a
	F57vbcRYYcBm0CdSWG4oUxv1yJlLo99TparfRVgPhmF34AFTa1jwYRTZlRO8PwvBRKeP7akBdog
	jOGFCXLd2007I68p2XTqAVT7Ke87Xw2niz80GLxdFBxW1oS4AO/YwnlOtF6icouytr6AyLRRQDU
	eBSwX+h+AOISrFx837+vRYz+YlViqHUrjQtpjIVzJPhm/ZZYiGBVesj7CyVVevW3hpekHlRkSRb
	uLg1T7qNvL+7OWAxFAt1GzXhLU0aB2FIvPcQPr3uwHqHFZDrW5OnLUtV5co5I/4nqdjkK62vn0a
	7oAMVs3vXPvVyqRKZ/aKYw6vFpzBm1SVe8wIYMBBR9B4jlno9RXKYaneV3JaJyQqMaox/J/U7/K
	N4KRg==
X-Received: by 2002:a17:902:e5d2:b0:2c0:b1b0:376e with SMTP id d9443c01a7336-2c1eb742daamr2207405ad.8.1780684611222;
        Fri, 05 Jun 2026 11:36:51 -0700 (PDT)
Received: from google.com (171.46.125.34.bc.googleusercontent.com. [34.125.46.171])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0b315esm8340917a12.26.2026.06.05.11.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 11:36:50 -0700 (PDT)
Date: Fri, 5 Jun 2026 18:36:46 +0000
From: Sami Tolvanen <samitolvanen@google.com>
To: Michal Gorlas <michal.gorlas@9elements.com>,
	Kees Cook <kees@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Aaron Tomlin <atomlin@atomlin.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org
Subject: Re: [PATCH 0/2] module: restrict module auto-loading to privileged
 users
Message-ID: <20260605183646.GC2939956@google.com>
References: <20260515-autoload_restrict-v1-0-40b7c03ddd04@9elements.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515-autoload_restrict-v1-0-40b7c03ddd04@9elements.com>

On Fri, May 15, 2026 at 07:20:18PM +0200, Michal Gorlas wrote:
> Add option to restrict the module auto-loading to CAP_SYS_ADMIN.
> This is heavily inspired by CONFIG_GRKERNSEC_MODHARDEN of the latest
> available Grsecurity patches [1]. Instead of checking whether the
> callers' UID is 0, check whether the calling process has CAP_SYS_ADMIN.
> The reasoning here is that many modules are autoloaded by systemd
> services which are running as privileged users, but do not have UID 0.
> While systemd-udevd runs as root, systemd-network (which often
> auto-loads a module) for example runs as system user (UID range 6 to
> 999).
> 
> When enabled, reduces attack surface where unprivileged users can trigger
> vulnerable module to be auto-loaded, to then exploit it. Recent LPEs
> (CopyFail [3], DirtyFrag [4]) for example, would have been mitigated
> with this option enabled as long as the vulnerable modules are not built-in
> (or already loaded at the point of running the exploit). 

This sounds potentially useful as an optional feature. Kees, you've
looked at grsec features in the past, do you have any thoughts about
this?

Sami
