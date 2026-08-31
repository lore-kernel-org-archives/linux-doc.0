Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C23853ED01
	for <linux-doc@vger.kernel.org>; Mon, 31 Aug 2026 15:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788189987; cv=pass; b=pWorS2EgpOMTkJm+po7qrrrRIESEvtWWGRJrWSxLETDOljCQ0Aso6Es8xE3r9nU/lYCdl903E10+WrEbUN2hmi+vWz0TvvsuOQSC6tC0b1He7i7Xvjy60z6WIC3yffHNKE+gvORHZcjQN47HkUwLi4/FfJbeRA4GkXR3ZTX4unI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788189987; c=relaxed/simple;
	bh=PSPMRmWPcYte4abw7ulwi8Gm7cYsldtwsvZeCimevjo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tDDAoc+zBLRJXyicpBO8PVt3/0dJmzcqMbFS8+BEyKCSQ/enUiZjl/pKby9mgVhs2Lw6u+ofYPIwcNBFvD2a51dP3icwLsAFjyBFEpHkfh2T3cD2DTVKAxR1ijFcKwx9ivfaRvEcDb9F+9JWNWSGJKkKpkKIdpoBl2fYBg22rOU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h+TE+GVZ; arc=pass smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h+TE+GVZ"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-52fac937235so360121cf.1
        for <linux-doc@vger.kernel.org>; Mon, 31 Aug 2026 08:26:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788189984; cv=none;
        d=google.com; s=arc-20260327;
        b=aqwviKithGdg1xw8HRQlX9doG/65cFHDGY8NBtrd9QVpp4/LTp5Xn+ExSy3IAp2g04
         B8L52yuxAMDgeAMtbXpAijX+qIr8NtuK4uvyVB9nzxYjy/xNQ/1ffofwqhwJUoy48E2T
         5EALYuFB6t3kGxnIr/bKXjlQHdscblAi2+paCOYMFlr2I6QN8D9jA9yZLIf/jXY05z5q
         Lmx9bQkq4cmfnQ5fYf+cY/OSzVqoVfIvKTg0xuUGHSLKkBuQtJUzk5K4hYW1X1ywcD7I
         5KgGV7vRjkhZPys4xY5C+Qx8pJ8uIpVhdLvKI0qE9wwNOe3SYYoA4gq7e2ijsWZ1HqrC
         aLDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HKx4z/gVUVYo3h0sY7zCFMtg9vG2hgH7eEzaxSp487c=;
        fh=JoyzmG+fBsHDP2CrQfP55EersUE88wkToVe3Stl5rM0=;
        b=RzJ+N2HF9KsvYGTZCjfNDv+GvqWzmXkBkQ60gtIAJ0xgJQTsD0wWhl1pFKs9XH0Z9K
         zDG66U2Kw/NeS+lOrI/jBbM13vxBz2RA2QLWtBePT/biB7cdCTBBEouX+FKkc7O4AuZJ
         tQLO2fXmxflOOCDBoJIM7xB+7qY6XsdB5UWiCO/plOFT7LqoCvztqsXWR9njSDrAsUe1
         ccvjVvjSgbPZreKv44Wap4yci1V5t8T8vBGH61DV2MSZWEMQLv5rjV7Hmg7wfmjOe04d
         ykP0piMAKnuzyuHHM7XkcTvtOtKrf91ErvRioxolsUiL4BmvpPPyYFBRmuxzfCrZ40pa
         K3iw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788189984; x=1788794784; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HKx4z/gVUVYo3h0sY7zCFMtg9vG2hgH7eEzaxSp487c=;
        b=h+TE+GVZdJ3h9caROdNsfMLza7qu7ybcRXIYjqlDqz2x52dzSuOdw6UGiU1l43bjCx
         3mrYmbHH+KUYoL+d9b9nq1Pdb7duVys3uC/O3YqxXjGlXeJ6bQwEFnepDLKhlPNpO6Rm
         EKsK9gwHOuv1LhroBpxO/0YLzjG08f7Bvwj90BZOomTxnq46Cp9/FAEC5H7gDLk9CbnZ
         n5VfVv7VFqQtZRjUGlawic9LwtrHvKmmb53cQ1fdM9ldcj5YSxmQ8Hav6tHsI2mUniWw
         g6y6dTVUIyvohN8KWc2P8VywQp0qJVY5Ubv2yHN8oLvRE5Ovip3DmkyI6+YHqEmhqWqq
         BS+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788189984; x=1788794784;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HKx4z/gVUVYo3h0sY7zCFMtg9vG2hgH7eEzaxSp487c=;
        b=U5UiOQMCqFM/oyz0At/dPZF4ajbEuPHgVWaKxfAEClzU6MAdHBe14+8y/qPApnh80c
         tfMPhyOimL/SLWq12QssrKgQjVAi7ChIPXepTTDWMeRckfw6If8IxYcI5WSEsg9Y7cPF
         +oBM5A2RXt9ZPQrThR7mnXR0EI+YwufGkrfC24RdxMOUs9IHw7eVL+5mV1BexKrE99QP
         wX8KQIs4CeXy6Suo0zlqkNO+73+0B72OsBa7htud4u4rUE2uITPy8xcJQmem+1wCwZd4
         NyJN/GMJ8XlewcYfeHe7fDu/73W66Suw1OLwMOqSlINFSCF1ZGjaccc629fF8O4KAw2d
         eUQA==
X-Forwarded-Encrypted: i=1; AHgh+RqUcpHSpbPyTIP82pRWX7+gmdCKDPviO7uXMOOZFUUvOftbh/4Ym8O0/t74uUeeGycb5GmhK64ACL4=@vger.kernel.org
X-Gm-Message-State: AFuF++mOZ+uS5eunIyCF44b8217/8bQXhVV0iQqRRt7JIgNWjeh811gN
	hDVpRp6EzRBMtOh3OADFNrfkSJUAirrTqTUPFVuOUEVEiOPZ4HgqN7nmJPfpd80mabXIYat7LQo
	fuAAUpyAfi0jDz0Kll1XnO3dS213SQ5njY1cwoWjw
X-Gm-Gg: AR+sD12T4h+Fi4htPfwxNfzHAOxFd/PlGSKa28tKNU4x1ld/0LbKeMT5HRIhPWpZUFT
	ZRzsL0tkn6+mV/QN9uEsmLkhftBGn/nNzw5laT81yfq8UuHCOQYOKE3169DDU1C6OUBhJn8tN07
	v0IOmam82+dd4oOPvjtk+N9k/24nguk0BN0Bk8HwJ/SjWPjUEwqMVERlRUEtBT0VaWWSwLrHNEc
	pFdLfMj5TMsJuo/PViq70LXt5MuLDNnpeIK2NSQmYqTKgXwzmykNQ4Of51D2aQiLKiMl8yq8mOx
	KkcOUfkIJUhHIVyqlojLpsxF859m0PZ55W7F/MrZb+w=
X-Received: by 2002:a05:622a:598e:b0:52d:7a3c:8396 with SMTP id
 d75a77b69052e-52ff6f30c8emr34733291cf.2.1788189983103; Mon, 31 Aug 2026
 08:26:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831-docs-memalloc-guide-v1-0-547718c274c1@kernel.org> <20260831-docs-memalloc-guide-v1-1-547718c274c1@kernel.org>
In-Reply-To: <20260831-docs-memalloc-guide-v1-1-547718c274c1@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 31 Aug 2026 08:26:11 -0700
X-Gm-Features: AcwNN1WFRSN--wzS21rSGRH8C_o1FPRMTwmuGQ5Gza9KkI5iwhlrj79hsn8yfPE
Message-ID: <CAJuCfpGMOW89vVaAX_69MiMy+4VV0o-H+OBqkLRVUVHToM241g@mail.gmail.com>
Subject: Re: [PATCH 1/2] docs/core-api: memory-allocation: add
 k[mz]alloc_obj() and clarify kmalloc
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Michal Hocko <mhocko@suse.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Vlastimil Babka <vbabka@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 8:13=E2=80=AFAM Mike Rapoport (Microsoft)
<rppt@kernel.org> wrote:
>
> Since v7.0 the most used memory allocation function is kzalloc_obj().
>
> Update hte memory-allocation guide to describe k[mz]alloc_obj() family

s/hte/the

> and make kzalloc_obj() the first answer to "How should I allocate
> memory?" question.
>
> While on it, clarify description of kmalloc() size limitations.
>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Reviewed-by: Suren Baghdasaryan <surenb@google.com>

> ---
>  Documentation/core-api/memory-allocation.rst | 30 +++++++++++++++++++++-=
------
>  1 file changed, 23 insertions(+), 7 deletions(-)
>
> diff --git a/Documentation/core-api/memory-allocation.rst b/Documentation=
/core-api/memory-allocation.rst
> index 0f19dd5243239..8ecfa4d35f4f5 100644
> --- a/Documentation/core-api/memory-allocation.rst
> +++ b/Documentation/core-api/memory-allocation.rst
> @@ -19,6 +19,12 @@ Diversity of the allocation APIs combined with the num=
erous GFP flags
>  makes the question "How should I allocate memory?" not that easy to
>  answer, although very likely you should use
>
> +::
> +
> +  kzalloc_obj(<VAR_OR_TYPE>);
> +
> +or
> +
>  ::
>
>    kzalloc(<size>, GFP_KERNEL);
> @@ -139,10 +145,13 @@ allocate memory for an array, there are kmalloc_arr=
ay() and kcalloc()
>  helpers. The helpers struct_size(), array_size() and array3_size() can
>  be used to safely calculate object sizes without overflowing.
>
> -The maximal size of a chunk that can be allocated with `kmalloc` is
> -limited. The actual limit depends on the hardware and the kernel
> -configuration, but it is a good practice to use `kmalloc` for objects
> -smaller than page size.
> +Since 7.0 there are type aware kmalloc-family helpers that let you safel=
y and
> +conveniently allocate a single object or arrays of objects with kzalloc_=
obj()
> +and kmalloc_obj() and their array versions kzalloc_objs() and
> +kmalloc_objs(). These helpers only need the type of the object that shou=
ld be
> +allocated and the count of elements in the array for the array versions.
> +
> +As of v7.2, vast majority of the memory allocations use kzalloc_obj().
>
>  The address of a chunk allocated with `kmalloc` is aligned to at least
>  ARCH_KMALLOC_MINALIGN bytes. For sizes which are a power of two, the
> @@ -154,9 +163,16 @@ Chunks allocated with kmalloc() can be resized with =
krealloc(). Similarly
>  to kmalloc_array(): a helper for resizing arrays is provided in the form=
 of
>  krealloc_array().
>
> -For large allocations you can use vmalloc() and vzalloc(), or directly
> -request pages from the page allocator. The memory allocated by `vmalloc`
> -and related functions is not physically contiguous.
> +`kmalloc` always allocates physically contiguous memory and the maximal =
size of
> +a chunk that can be allocated with `kmalloc` is limited by `MAX_ORDER`, =
the
> +same limit also applies to the page allocator.
> +
> +Internally, slab allocator differentiates allocations of different order=
s and
> +delegates larger allocations to the page allocator, but for the users of
> +`kmalloc` family it is entirely transparent.
> +
> +For large allocations that do not require physically contiguous memory y=
ou can
> +use vmalloc() and vzalloc() family.
>
>  If you are not sure whether the allocation size is too large for
>  `kmalloc`, it is possible to use kvmalloc() and its derivatives. It will
>
> --
> 2.53.0
>
