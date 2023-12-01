Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lQ+/KwqC"
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAC849D
	for <linux-doc@vger.kernel.org>; Fri,  1 Dec 2023 09:45:33 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-5c63bbbd21dso577932a12.2
        for <linux-doc@vger.kernel.org>; Fri, 01 Dec 2023 09:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701452733; x=1702057533; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9uudzapsKSbAF1Nf6v1rAhKcYau6FtPD1nj4fOsoHgo=;
        b=lQ+/KwqC2jl5gjb6lqTHU+tWGGd6LRnV0E5lvK9bUjmeHqxuZKfyA7A5zd1dWUE94d
         3oY2fC/qxmG3oma0iIcfhJ7xO+yhesOSUlpT6g0nIj0R+Fyu6KFm3wg1V/sXFmBfOPJO
         6oPc59TcnfW7jJMmn5A6FYTDuu/KqKc6m7wj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701452733; x=1702057533;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9uudzapsKSbAF1Nf6v1rAhKcYau6FtPD1nj4fOsoHgo=;
        b=JuDOOcLiSZ7+ySnYoX83WMJxL6yji3NDaFGHvCE8xUQCD7XjU0lG2qDdCqpELHiCyE
         m1owtP2da8nwTrSQMN3LPIhvjsP9YNGLMPh4xNioHLonK0TP/B7P06RCNcg7JzYJkC7X
         nW8Hc8+ssxwNbArutMjuyQM0f/NIHkuLP42rZGYiaYoSHRNGg6k19nrLkcYkBBDZMQt8
         dt7i3dheW6BoMs8WwxGUguCeZIQVQb7ICOfvCtPWqq27c1WAx6XBnqAr/oaYXEnfUSUC
         qOJkCFCXwO4rLRRKW/sEoMHpG3PkrZlAeviPiXY5De43j7+gSQiytTthEPshn67zBOts
         O+Ew==
X-Gm-Message-State: AOJu0Yxww9upwbKVXpmPbGNO2rVKeujEkPdcc0JAA4p8QIbn1JDO54fO
	uUb4Uo3H70yOAUC9QTabZfsnSA==
X-Google-Smtp-Source: AGHT+IE8Y3Xlb1nIh430VzJEjJko7Zybqxd7NABPBjihyrc4oBTu7YxNT8W6hr62WXGLZOQCgU7lbQ==
X-Received: by 2002:a05:6a20:3d07:b0:18c:4105:9aa8 with SMTP id y7-20020a056a203d0700b0018c41059aa8mr24903073pzi.51.1701452733274;
        Fri, 01 Dec 2023 09:45:33 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id q13-20020a056a00084d00b006cdc0181de2sm3258261pfk.128.2023.12.01.09.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 09:45:32 -0800 (PST)
Date: Fri, 1 Dec 2023 09:45:32 -0800
From: Kees Cook <keescook@chromium.org>
To: sxwjean@me.com
Cc: vbabka@suse.cz, 42.hyeyoo@gmail.com, cl@linux.com, linux-mm@kvack.org,
	penberg@kernel.org, rientjes@google.com, iamjoonsoo.kim@lge.com,
	roman.gushchin@linux.dev, corbet@lwn.net, arnd@arndb.de,
	akpm@linux-foundation.org, gregkh@linuxfoundation.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Xiongwei Song <xiongwei.song@windriver.com>
Subject: Re: [PATCH 1/3] Documentation: kernel-parameters: remove noaliencache
Message-ID: <202312010945.3320D8EFF@keescook>
References: <20231201031505.286117-1-sxwjean@me.com>
 <20231201031505.286117-2-sxwjean@me.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231201031505.286117-2-sxwjean@me.com>

On Fri, Dec 01, 2023 at 11:15:03AM +0800, sxwjean@me.com wrote:
> From: Xiongwei Song <xiongwei.song@windriver.com>
> 
> ince slab allocator has already been removed. There is no users about
> noaliencache, so let's remove it.
> 
> Suggested-by: Hyeonggon Yoo <42.hyeyoo@gmail.com>
> Signed-off-by: Xiongwei Song <xiongwei.song@windriver.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
