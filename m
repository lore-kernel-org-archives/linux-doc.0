Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="gSS0f7dA"
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFEFFDD
	for <linux-doc@vger.kernel.org>; Wed, 29 Nov 2023 07:04:05 -0800 (PST)
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-3b83c4c5aefso4339908b6e.1
        for <linux-doc@vger.kernel.org>; Wed, 29 Nov 2023 07:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1701270245; x=1701875045; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k4Ao7lBgcd+ybKERFuAK+nkaWPQkkI/HHB0oBMFxsuY=;
        b=gSS0f7dAo5U6qPxA1nJZhCvK3efZkpX2hHe1X5YJwzEYgO1JPkVVR74+2rL4K89BLn
         O2Oy2+0zz+PYTICB8bkCYCerNH0YnDWaZZdXfZUhScHR/Pet9FXUsyqoFJigyzdOuZpm
         nlN8Pk+4TBBKdq+mkP3ZYilYOIE7XNbdx1z8AlNuTPpdiSALL1VyENFlDySig7htomBJ
         aVpig6LbmyRTnvE3lnpXOSogTLzqmfRGmQBD8rjkUjbX3RyKeZ4Jx6KHRwmA2lGyoEE9
         ZosTbaORpqwBrcDEWOYSSZnUcGAlW1LN7cpy/zGh1c0obLUR4qkPjld8uSxgXjHRffbx
         JY3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701270245; x=1701875045;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k4Ao7lBgcd+ybKERFuAK+nkaWPQkkI/HHB0oBMFxsuY=;
        b=YOPI/KjSTljmlUHrCBuI9yAH4sMd6SKJt6lVLgRCPicp5eMj4DpOqfsSipYP0m1fsx
         1hp130Xn4L6rXQMuKFVLVIPvYe/9s1L9IWKixp9mzBjYr71ZmgyNYVF+ATTctpyNUTDs
         yic6a/zMjpuAWjql6p7PUaa9HYJQI3aQNGmnY/zGB6S8+7IBQYQDK5UpSoNuVMnHpu2u
         tF2GqMljJlSiph5k/3N1fPhLUiHxZL/YgvOaAdxmGsbRSascHlhzqef7B/DTeVK7IBrM
         McO7k39sCq2tjK/qOvhAeswuIGOZ2BpKzKDYZvgenTO0drH4V+ZghNVdCk+AKZl5ww0l
         fbhA==
X-Gm-Message-State: AOJu0YxFkJ+vZj7izwA7KTaiAoEtiPxAGe1glIBoYHARYhbh0du+7xgy
	FJz1vl84R56MxD73AyX9Gz39Bg==
X-Google-Smtp-Source: AGHT+IHD70IfG8FBZ3xYBo0dZ2qCdJIWjr46lOgat1KTOIvbAN1mbw/QRSgQ4yJcSH/qhXAu2olYow==
X-Received: by 2002:a05:6808:1288:b0:3b5:84b0:6be6 with SMTP id a8-20020a056808128800b003b584b06be6mr28312075oiw.47.1701270245316;
        Wed, 29 Nov 2023 07:04:05 -0800 (PST)
Received: from localhost (2603-7000-0c01-2716-da5e-d3ff-fee7-26e7.res6.spectrum.com. [2603:7000:c01:2716:da5e:d3ff:fee7:26e7])
        by smtp.gmail.com with ESMTPSA id r10-20020ad4522a000000b0067a769e2259sm198042qvq.141.2023.11.29.07.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 07:04:05 -0800 (PST)
Date: Wed, 29 Nov 2023 10:04:03 -0500
From: Johannes Weiner <hannes@cmpxchg.org>
To: Nhat Pham <nphamcs@gmail.com>
Cc: akpm@linux-foundation.org, cerasuolodomenico@gmail.com,
	yosryahmed@google.com, sjenning@redhat.com, ddstreet@ieee.org,
	vitaly.wool@konsulko.com, mhocko@kernel.org,
	roman.gushchin@linux.dev, shakeelb@google.com,
	muchun.song@linux.dev, chrisl@kernel.org, linux-mm@kvack.org,
	kernel-team@meta.com, linux-kernel@vger.kernel.org,
	cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, shuah@kernel.org
Subject: Re: [PATCH v7 2/6] memcontrol: add a new function to traverse
 online-only memcg hierarchy
Message-ID: <20231129150403.GB135852@cmpxchg.org>
References: <20231127234600.2971029-1-nphamcs@gmail.com>
 <20231127234600.2971029-3-nphamcs@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231127234600.2971029-3-nphamcs@gmail.com>

On Mon, Nov 27, 2023 at 03:45:56PM -0800, Nhat Pham wrote:
> The new zswap writeback scheme requires an online-only memcg hierarchy
> traversal. Add this functionality via the new mem_cgroup_iter_online()
> function - the old mem_cgroup_iter() is a special case of this new
> function.
> 
> Suggested-by: Andrew Morton <akpm@linux-foundation.org>
> Signed-off-by: Nhat Pham <nphamcs@gmail.com>

Acked-by: Johannes Weiner <hannes@cmpxchg.org>
