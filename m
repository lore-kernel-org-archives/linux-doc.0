Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E3633CF
	for <linux-doc@vger.kernel.org>; Mon,  6 Nov 2023 19:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ncf.edu header.i=@ncf.edu header.b="GhQMWMCj"
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 267EFA2
	for <linux-doc@vger.kernel.org>; Mon,  6 Nov 2023 11:06:54 -0800 (PST)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-1f03db0a410so3024969fac.1
        for <linux-doc@vger.kernel.org>; Mon, 06 Nov 2023 11:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ncf.edu; s=google; t=1699297613; x=1699902413; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vYgbVooXzG9bXvnAO9hh0cIK7Z3AtpRVQORTv9KMDa0=;
        b=GhQMWMCj5tCwqthSVNwzIaTq48B+q/dZWKKnlyAo/Mqs0lpBigQJSs3SCVoULGuwCW
         Z2oVsxSApPrT+A5rbrgv4KDocDVhbK8wz1nZpeam61JB56ymQ74Jcu2vDg9NovC4b701
         Mg1aaCnj5ePR2zvYBFSuCWZuYroVZ0lZu9Z4Zjxu2bm11G5clSXJjQ3KLfQh0kcEN4jO
         iiV0ZkPPrgqFDCQOjemjClfnefiq75kxhdJeHwB1KYM894pleyphQYsd6FmAhW5pBhJ2
         AObnZ8QVEspwEsvcCb+Mwe1vQE011ROPM77yYh1ZIR8muP2EEKQMts61hSGxeq1//FJj
         sZyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699297613; x=1699902413;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vYgbVooXzG9bXvnAO9hh0cIK7Z3AtpRVQORTv9KMDa0=;
        b=qGi/e6EuU6dQjr6qD78H+gg4xHORZUhLQtYkBJ7hU2hFB5J1c1sst1vXqULZ8y8zBP
         8zV3t5njXwipTJ8vNRnVclY3CRXlCfR6mmvKOUrUlmzakYgqX5sxdwBpMutinnSf/Hfk
         M9XXeqf1/hJwYsQaL4DkiEFBWL5An7f8cU/8B2aYa9FnCYygD3lCnGmkSovjzbMy2nqO
         BinFx5LMEgmNDxNcGFR1UphfVHCtO6tMCd+YaHiNUuj5uIU5Zp03scimsNmTDN0gjE/Q
         7OLDh6F2TvVLteiI5Wp7KjyPUYppsVxyi2KlcxQ7HzLfExfpbPIUKd5N/0PSWC1OLWbi
         lrCw==
X-Gm-Message-State: AOJu0Yy4vDDzF+chR76zbZvxAsTTEWX63jW792TRKNymYREqZ8M3K3G6
	moCxYlomaZdKrG6gv7fhRrjVAw==
X-Google-Smtp-Source: AGHT+IH9OffbmsvZj+QnoxsyZtHU5JoQN6Vh73gHIVV9NgsvSQfbLQDqJBZsTJlf5jNN45d5OrYJSw==
X-Received: by 2002:a05:6870:11ca:b0:1ea:29a:8628 with SMTP id 10-20020a05687011ca00b001ea029a8628mr549121oav.15.1699297613453;
        Mon, 06 Nov 2023 11:06:53 -0800 (PST)
Received: from localhost.localdomain ([2601:580:8201:d0::d089])
        by smtp.gmail.com with ESMTPSA id ft8-20020a05690c360800b005a7b8d12f52sm4617500ywb.40.2023.11.06.11.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 11:06:53 -0800 (PST)
Date: Mon, 6 Nov 2023 14:06:51 -0500
From: Hunter Chasens <hunter.chasens18@ncf.edu>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Lijo Lazar <lijo.lazar@amd.com>, Linux Documentation <linux-doc@vger.kernel.org>, 
	Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org, 
	Linux DRI Development <dri-devel@lists.freedesktop.org>, alexander.deucher@amd.com, evan.quan@amd.com, 
	christian.koenig@amd.com
Subject: Re: [PATCH v1] drm: amd: Resolve Sphinx unexpected indentation
 warning
Message-ID: <irp2myv4jp6o7vut5m7ax4hya5764xzustf2klxfpys42qmevk@yxxus464hito>
References: <20231105210044.70371-1-hunter.chasens18@ncf.edu>
 <ZUh2fuCjmgle3vd9@debian.me>
 <665794d7-38e0-4e74-9af7-eca986792e44@infradead.org>
 <ZUigbshGGc451V5L@debian.me>
 <875y2f193t.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875y2f193t.fsf@intel.com>

First, apologies to Jani Nikula. I accedently top posted on the other thread.
My email client is giving me a hard time. The following works and, if 
everyone agrees, I'll send out a v2.

 * E.g.::
 *
 *  S: 19Mhz *
 *  0: 615Mhz
 *  1: 800Mhz
 *  2: 888Mhz
 *  3: 1000Mhz
