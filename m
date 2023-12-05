Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K4NqijX6"
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D30D1BD
	for <linux-doc@vger.kernel.org>; Tue,  5 Dec 2023 10:03:04 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2c9f099cf3aso51492061fa.1
        for <linux-doc@vger.kernel.org>; Tue, 05 Dec 2023 10:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701799383; x=1702404183; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H2joey/D+/Fter5JFQfAZeSyog4t3NYaVzZzIbt4q+Y=;
        b=K4NqijX6vzRxeN5fCvsWetxzBFw6RHkzrjJOLDgmkOqrYLrnEQ3/IaQLc5h8M3pY5f
         ecFe6bfGAlf/0KNTUgYgUyfkxEcwKS2JJ+htNv87SnIIFuJVBUtxFm8z5u+sSmn+4mJO
         HzHcnfWtHdPReGa9Lf/QP4BHM4djMBauSIbj/0om0skuCWZpx5NAgFgnGBQFP5JMNe9b
         kFHfU8pQln5C/y3zicrHTUKNdj8KSaXOyvXAlPPvPV9r8GpmlzCVqQuijl0bOQRNObZU
         rIEETgW+gJw1a6+pNiBDHHVrjMWq4661p2eMHl6GBRybFHYu58CZI5gidxJmHp7ZYFgP
         IcMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701799383; x=1702404183;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H2joey/D+/Fter5JFQfAZeSyog4t3NYaVzZzIbt4q+Y=;
        b=iCpTssiQHF7eHHKJaueC9lI2/Fv/ZJ6q8fZ7XQeU025D2BDEPG4JsXK0L4lKbWozYw
         VxNP3Cl5670qqA7hM5HfmuSTkW2Y8gg3VVsHq9wihbwLiF4z4GGdDCU/1P1tICLc02yk
         1RCyXuaOAuZhCl56Xenly++VqfpS6Ka9pbXRwlV8fLF2Qj4JgM0O70ssYp1iHq0hp730
         iCx3aQDFyIBhdgRN0kZ342K9xEzLfvGzm6cFaLKRTjUY1FcvmUKAlW2yLf/bTwkoDABc
         e3y/bSGJHRdDxO0bnURt5PnNs0S3iASnpuYaJqgTmdcKTLfe2qYbzVF1kjIZVQScTXM5
         Dsvw==
X-Gm-Message-State: AOJu0YzwUq3qUuMxQzE6U1ZcnYFB7CK9kYKj8l2vw8IlH9T+Hl4ZR2SC
	daqbr21xPMYHILjE8BuuIgIgtpaxtaOmDLJ/H6gZgA==
X-Google-Smtp-Source: AGHT+IEXzOUK5t8bzip+5ZofybxHjbqPtQkvb0sQwnXT+0r4S9PaBhfe3FGVUffgOkL3/lvjFblZ2xbK3YEUDgy6Tw0=
X-Received: by 2002:a05:651c:1056:b0:2c9:f5ec:40ff with SMTP id
 x22-20020a05651c105600b002c9f5ec40ffmr2569169ljm.26.1701799382434; Tue, 05
 Dec 2023 10:03:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231130194023.4102148-1-nphamcs@gmail.com> <20231130194023.4102148-3-nphamcs@gmail.com>
In-Reply-To: <20231130194023.4102148-3-nphamcs@gmail.com>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Tue, 5 Dec 2023 10:02:23 -0800
Message-ID: <CAJD7tka+e-RWVN8qkCLv52z8G0KAXNO87CqV3p5Wgkx6BvneLw@mail.gmail.com>
Subject: Re: [PATCH v8 2/6] memcontrol: implement mem_cgroup_tryget_online()
To: Nhat Pham <nphamcs@gmail.com>
Cc: akpm@linux-foundation.org, hannes@cmpxchg.org, cerasuolodomenico@gmail.com, 
	sjenning@redhat.com, ddstreet@ieee.org, vitaly.wool@konsulko.com, 
	mhocko@kernel.org, roman.gushchin@linux.dev, shakeelb@google.com, 
	muchun.song@linux.dev, chrisl@kernel.org, linux-mm@kvack.org, 
	kernel-team@meta.com, linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, shuah@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2023 at 11:40=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wrot=
e:
>
> This patch implements a helper function that try to get a reference to
> an memcg's css, as well as checking if it is online. This new function
> is almost exactly the same as the existing mem_cgroup_tryget(), except
> for the onlineness check. In the !CONFIG_MEMCG case, it always returns
> true, analogous to mem_cgroup_tryget(). This is useful for e.g to the
> new zswap writeback scheme, where we need to select the next online
> memcg as a candidate for the global limit reclaim.
>
> Signed-off-by: Nhat Pham <nphamcs@gmail.com>

Reviewed-by: Yosry Ahmed <yosryahmed@google.com>

> ---
>  include/linux/memcontrol.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
> index 7bdcf3020d7a..2bd7d14ace78 100644
> --- a/include/linux/memcontrol.h
> +++ b/include/linux/memcontrol.h
> @@ -821,6 +821,11 @@ static inline bool mem_cgroup_tryget(struct mem_cgro=
up *memcg)
>         return !memcg || css_tryget(&memcg->css);
>  }
>
> +static inline bool mem_cgroup_tryget_online(struct mem_cgroup *memcg)
> +{
> +       return !memcg || css_tryget_online(&memcg->css);
> +}
> +
>  static inline void mem_cgroup_put(struct mem_cgroup *memcg)
>  {
>         if (memcg)
> @@ -1349,6 +1354,11 @@ static inline bool mem_cgroup_tryget(struct mem_cg=
roup *memcg)
>         return true;
>  }
>
> +static inline bool mem_cgroup_tryget_online(struct mem_cgroup *memcg)
> +{
> +       return true;
> +}
> +
>  static inline void mem_cgroup_put(struct mem_cgroup *memcg)
>  {
>  }
> --
> 2.34.1
