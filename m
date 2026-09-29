Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240EB478E38
	for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2026 15:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790697506; cv=none; b=FLCUWE+hA8DmRXpP/uvA0AIXaqqoKXE7vnwEsUotmG0D+JLqepWvNiUP0ZZCMNTf98Z0ECrkRUKyBNhOJoCbiPws0GToi+5zXRoaQY+UGbMu1w9s2gPPyY5/6bHFhd82Ys/XAJCQOhfTDK/Jl/YrilFlkFuVyU5B97eRWaLs098=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790697506; c=relaxed/simple;
	bh=nR4yrTOIgVgspvjCPgKKmvkm5cZCrViKQN79fpTorck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RKyq9zhFy4PCJfcMTMVmoJDiZjgfRkNSvb0IxOlJP1On1yTrIR6QTkRiEsBSJiD1jUXcIQBHdBE2pn8GgD7rztjCzviVQnGRpAoEOBryiKZxbbecW5BsTPhW7pj+FCWkCiJ+4dXbhSh45Ob1qRVhZAH/C/kcl7Qduc6PmpHcGFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=TGjFZgg5; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="TGjFZgg5"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d3920so32758905e9.1
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2026 08:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790697499; x=1791302299; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gf4CL38l7K7zHB2Jr75kV3VIF1+DE+Av3C/FhqhlLqk=;
        b=TGjFZgg5lUHeZxukRtGDBpWWXiPuev8gp7o7FIX6qFXoKC2EajqRD+/ExUDCSfZjoC
         i4OrZjFiZGSOtA6mpUM4f/v/zeZAXWCL3g41cedVNWBPRLuxv+9Dd+SWUiKp5re4pZfU
         jJ7hvCUY3S01HlnQisdD/KK+9JhEQayTnTWsXyOQs91JsZXPSkOOZZ2+4l+vktxu61vb
         8w/OE2ayTWQXiV2FZWNafA6HdPrYCAqgm4k0PQXdk1/Vwauf44GR+0YcnVQSOaFVxjpB
         d+/mHzpjlC5QOs1jyDU2SN5c6YrW8WpQYyg2fsMt9DDG51eS4rnjRbgfKV2Dql7KmKt4
         ocqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790697499; x=1791302299;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gf4CL38l7K7zHB2Jr75kV3VIF1+DE+Av3C/FhqhlLqk=;
        b=i96Gu9mx4xFu9jZdVWaZdeUd1nyBa3o2OzDPGDN2luGt+uetLZwbCGq9bBWjQhpg4M
         rhzaOwknmmyBFh8PXZkDhKqCffyvy+ETKtfSbQ+cDOxQPFUUpt0VuQxMzyNkLPM58wib
         7OG02Jt/++Ha24rSafd6D/i/zl0GehDm1W22eWw8qRPgpu3WOCPsaG3ssPFDxy+2/zrF
         byOmGhuQ6dW66w1wIspbH/AIObwUt1R6Dkp+4JWPLEy/Bb8b5luh8XCBvBYttLAG7X6J
         aHuzu0qJZzf2htAJODA7LPEaFMWWdXnjjX/sYvWkkX+YrgCuY9VK8GqEyJmqYb4EGdxN
         /zQg==
X-Forwarded-Encrypted: i=1; AKwUvBywm8/WCgNqUeAXS9rgBsiUgK0ylIjdK/BMCZDaGydIwYwni2O5WGoWATo4n+H02uGI5ipaX6Et8lg=@vger.kernel.org
X-Gm-Message-State: AFuF++kGS8/hAlRjNPi+QJVB4UV6Xm7g63QPQgxw5PqRzAXkHDnooBR2
	V2eun25dPN1IB1jIPysD3ZJugEY/foFRYpkhs56pPMtX7GouHeuq4Wvdc0uXlc6U6GE=
X-Gm-Gg: AYBFou2SONqT1+SuBtktowQk/E7WS7MmNkHxY8J3M7tKoFLbHtHOaP1I3bH9/Jcfrkg
	gv7HOzE+1jaRo5meekRbiWqG2wjF2ySmlNjWVG78cTe4aqHCpoZmBHw/90AHx+rJI2WnAfi6d+t
	CyTC8xCtWOlqvYnxkLGZ+af/VYA5Y1sPDVmYr6hW4ZJ41mBhwm+94myYpU6NTX+iwNfOqlWtWHQ
	SyfvHwIiXWERvcEu/y1cPxE1YUifE5IdNHb0gutbm2WGA+GAHXt/COL/4BV2ltqWYed7o/h6t8z
	Dqr+Y7qcyi+Ce++NnU2HVI2stZHjp5Kt8VQOfxAlKWGytTQIjXVTF52pgmlNt8eFN1FGvouxLB1
	VJb7ySkRy62A56Pj9v023xArA/sDYBTZo9SNLBMX4+CZHvWPG4Tz3uiyZGKYfSj5bYisPgxryB8
	emXDcwEnV+pPvPQP+tbSRTB+V2yqA9R9uipXtAYaspvaeC85Og+AbHAXe8EtoyoTN7HsE9ZI630
	V4v
X-Received: by 2002:a05:600c:1d1c:b0:49c:eb16:9fd with SMTP id 5b1f17b1804b1-49fe66c9ae3mr284330975e9.3.1790697499193;
        Tue, 29 Sep 2026 08:58:19 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F ([2620:10d:c092:500::5:5c0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cf9dfdbsm127631095e9.1.2026.09.29.08.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:58:18 -0700 (PDT)
Date: Tue, 29 Sep 2026 11:58:16 -0400
From: Gregory Price <gourry@gourry.net>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, 
	bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev
Subject: Re: [PATCH v3 06/40] mm: make map_kernel_pages_[prepare,complete]
 internal and unexported
Message-ID: <arvf-dEnIzsXhzkL@gourry-fedora-PF4VCD3F>
References: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-0-4583d8a23bca@kernel.org>
 <20260917-b4-mmap-prepare-vma-flag-sanify-v3-6-4583d8a23bca@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-6-4583d8a23bca@kernel.org>

On Thu, Sep 17, 2026 at 05:22:15PM +0100, Lorenzo Stoakes (ARM) wrote:
> There's no reason to export the symbols for these functions which are only
> called from internal mm logic, additionally there's no reason for them to
> be declared in mm.h.
> 
> This patch therefore removes the exports and moves the declarations to
> mm/internal.h.
> 
> No functional change intended.
> 
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

