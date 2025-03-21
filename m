Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921C186250
	for <linux-doc@vger.kernel.org>; Fri, 21 Mar 2025 09:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742550120; cv=none; b=X82k6y+WWKd0LNJ00RsSAFWhYFv393hS0OvqfsN40xxJs5SoaLOhYfE7zFH75oaB6QlNSN1ksTFnDsVI+LejN4e7j8iTnT22/QyaYiQQ06JegG1wO2f9+pLUgtRFdHs1jSpto/6eAxVbhYxjNbqWCWG9klOHJRvYnwy2G7myKD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742550120; c=relaxed/simple;
	bh=0/BHrVNiKMhKVJtYLbtO3NF7YAfxWVkjde7Dn/8RHts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=umtvYGSs2sXiroWuVgAuKKr++SLpqy0MxAf1aTunAbOeR7p4epgCaPdf7eVtx+roglrSiI9EXTDq+U7wMjyr9uEj8iIPRKnmwn3EIezX/xma1639XLve/K/d2Uikgm8wBZsc5dm5arI87T82OG/R3R76OmVbCxzHd5DzE4V8Azs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R7/TWo3h; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R7/TWo3h"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e5dc299deb4so1698830276.1
        for <linux-doc@vger.kernel.org>; Fri, 21 Mar 2025 02:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742550117; x=1743154917; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZA5GK2sSb6ZRsHG3hwvFNz3la3AkAW84sO40my6/nvQ=;
        b=R7/TWo3hxDDUhhXQF5LCwu5I43OLGrvlfK/NDJagQkQT7s/uvGfvxEZwLsfFCF28VT
         lh5/WJ/FCT6i3r9dR1rWQcTlrADVRoW/e+ztZ1yMccLX4bxSJqG3WPsUl+2b+ayKT9JF
         2nuys4YS1MfjzRmQNWbv8WkjoxU3RsB/ojf8w+bOHG5SXh7YcgU/GkCckPUWc4nNdrQ0
         rwqxtZ8+cRf3mArAeEva1QWwwrH5cIneyG6igUW0dHG/waqRnqMSwDH9WFpgPDGGkEt2
         2ddYYs1ifJyTFGGna+g3m9V6o3znX5wYN406VEEQ2c9FApHtAf+DdZXE2tjp2ToYuqq6
         WLpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742550117; x=1743154917;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZA5GK2sSb6ZRsHG3hwvFNz3la3AkAW84sO40my6/nvQ=;
        b=I+Z6CZ6YX4aey0xM2KP3PSYExf1ZIH7umXl/7ScYzx9i6jCkFiDzNqBvGn9F/HtYpa
         9a9OulzOOJY/MmpxEIVgkPDPAeObNyhbTXtkGH1C2aEkhMCWlL0iXUeHAde1CSma8aej
         pWA39lx9jV+cN2zqhYDC/15mQ0VEiaqxP8NC8TTctYIZufxO6gKahF4G7989zbPlthsL
         dbkxBEiYRUFMNNtQvJadc1MZUJ2CSW7mkoBlmEGvon7PidJnrVdRVI1VZExcj/YVykGd
         Q+JTt9J5SVItZEieksy8JO7xbepRbpSZmPILUtL/LJ47KG3XKg+4Nr09nX8rtco+TWPP
         N/1g==
X-Forwarded-Encrypted: i=1; AJvYcCWNsqPqc5MBbZVK7O7cB7ooa4PGHDt2hilR/+nNitCQFoDFZk718eAqdkvbgyNAWB1k2GVHJL2KA8g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMumfw3dvRRhTmuWDx0LG5ZUY4hcahIaOg+ifGjBxOeEK7pfqC
	tcQTWmsYNvKwVuOAQZBu4vZKy2ZB6fEy4XYhWyjYfyBHVVAqvsGWVNlvThNSoQpsC9UirQJw1kA
	OyxLEMiIWfG95dsqgiTyK8PdubgRlfd1FdC+KfA==
X-Gm-Gg: ASbGncu/2v1UI6et8gqPD4rsTIpJrOE6e9RXupq5zT3R7h/4SXOKKgGe3wNbXTXmu5K
	bQFQVAMEV9Ub59esAMdHtC060Es53T8+pO2C90qoKmSUIHutGk0m4GcmssFGLt2riQo45GDj+gE
	BvD36aCEJzckPmI4vK5U6ohqOgMQSyl2/LS1dcCtOzMrdGBPifXOcNUv6/bQ==
X-Google-Smtp-Source: AGHT+IEKaaJUdWmWHL2646zO7DMaiUnsG3MqMZ6mxJfwIWA0tFEcKSPm+dF0TuzCNPd05glsw///D/MWdGV8rQY5GGU=
X-Received: by 2002:a05:6902:1ac7:b0:e63:f1c4:4f0 with SMTP id
 3f1490d57ef6-e66a4fa30a7mr2740379276.37.1742550117306; Fri, 21 Mar 2025
 02:41:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250320024011.2995837-1-pasha.tatashin@soleen.com>
 <20250320024011.2995837-3-pasha.tatashin@soleen.com> <2025032058-reassure-veneering-0fdb@gregkh>
 <CA+CK2bA8vLjODhM1puia-SOnk9kiFhd7WXHVemh+YBuN4kSgwQ@mail.gmail.com> <2025032054-voltage-compactly-7774@gregkh>
In-Reply-To: <2025032054-voltage-compactly-7774@gregkh>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Fri, 21 Mar 2025 10:41:46 +0100
X-Gm-Features: AQ5f1JpjMQda1_RjxuH92Rddt7a_4H_pPlQi456w2UPU6c0mKZPSX93OKxGjrXE
Message-ID: <CACMJSevWnMgizuVYE3taZJO3tqXLJKOHhavU9VrD_aCN-PoaiQ@mail.gmail.com>
Subject: Re: [RFC v1 2/3] luo: dev_liveupdate: Add device live update infrastructure
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, changyuanl@google.com, graf@amazon.com, 
	rppt@kernel.org, rientjes@google.com, corbet@lwn.net, rdunlap@infradead.org, 
	ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, ojeda@kernel.org, 
	aliceryhl@google.com, masahiroy@kernel.org, akpm@linux-foundation.org, 
	tj@kernel.org, yoann.congal@smile.fr, mmaurer@google.com, 
	roman.gushchin@linux.dev, chenridong@huawei.com, axboe@kernel.dk, 
	mark.rutland@arm.com, jannh@google.com, vincent.guittot@linaro.org, 
	hannes@cmpxchg.org, dan.j.williams@intel.com, david@redhat.com, 
	joel.granados@kernel.org, rostedt@goodmis.org, anna.schumaker@oracle.com, 
	song@kernel.org, zhangguopeng@kylinos.cn, linux@weissschuh.net, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, rafael@kernel.org, 
	dakr@kernel.org, cw00.choi@samsung.com, myungjoo.ham@samsung.com, 
	yesanishhere@gmail.com, Jonathan.Cameron@huawei.com, quic_zijuhu@quicinc.com, 
	aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com, jgowans@amazon.com, jgg@nvidia.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 20 Mar 2025 at 21:52, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Thu, Mar 20, 2025 at 02:03:10PM -0400, Pasha Tatashin wrote:
> > I absolutely agree that demonstrating a real use case is important.
> > However, this is a complicated project that involves changes in many
> > parts of the kernel, and we can't deliver everything in one large
> > patchset; it has to be divided and addressed incrementally.
>
> Ok, but then don't expect us to be able to actually review it in any
> sane way, sorry.
>
> Think about it from our side, what would you want to see if you had to
> review this type of thing?  Remember, some of us get hundreds of things
> to review a week, we don't have context for each and every new feature,
> and your project does not have the "trust" in that we would even
> consider taking anything without any real user both in the kernel and in
> public userspace code.
>
> Breaking up changes in a way that is acceptable upstream is a tough
> task, usually harder than the original engineering effort to create the
> feature in the first place.  But in the end, the result is a better
> solution as it will evolve and change along the way based on reviews and
> requirements from the different subsystems.
>

If I may suggest something: typically you'd want to post the whole
working PoC on some public git tree for reference and to show the big
picture and then start sending out individual bits and pieces for
upstream review. This is how many big features have been done in the
past. As the reviewed code changes, you adjust the rest of it that
wasn't posted yet.

Bartosz
