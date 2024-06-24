Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B998142905
	for <linux-doc@vger.kernel.org>; Mon, 24 Jun 2024 16:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719247607; cv=none; b=Ab6uw0kZn9Dvj1YyfItbCBqktTroDsSfPcGnKMI214IaU9bA5SUGajaWKhs++WUfgSWxxebTzk3/01vgRKmMUODs0aO4l5rkPoHCZVLvj2PMcyb1+GG1iWXevp3BNs8oWXrmUESxOJurhNEjRAgC71H+oBaaElhexrRHLS84HJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719247607; c=relaxed/simple;
	bh=fKtutG1GdZlzjibolCmXSp5xe1fv3mZtm/w2hM6+lKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bHY8QyX3xeMo/vqmHsG4/Wv4TENpKoqkBqS1XL/ztoO1y/NfVRPPH9F6V6cyxqfyXEuOVIDw30mZf40geDwm4tyjB1+xPpoTOS1wFnR74rBAedAB9jcmYRiBX/8ZmtvvPfyissFmMWi7y8MnbGM0qZ0LJ0jMtDaymO9OmJieGjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=UqVzsasY; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="UqVzsasY"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a72477a6096so190677666b.1
        for <linux-doc@vger.kernel.org>; Mon, 24 Jun 2024 09:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719247603; x=1719852403; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UdsQVLlx/h6bzQBw/PftMKrwboL2BwJ/wPUlBpBpDJU=;
        b=UqVzsasYbbxyXI3D/wZwFkmWTyMpR7G356gHGr0m2JoO1S2sQ62EV0tvG7rL74m/Y3
         M15OG3GRAutabSIm8kY9phVDTvPfT20TncYmL24PCASuBY7YqTpq4abGbskOQBF75uGS
         uZNLFcL9wGrlMhiiQoE/e/kAxwxTyM2JUmr6hEljshGv8Zi7schkPfYOuvapYKnEzTT4
         dRjyfodfHMIdjeNCFyImR+j+QOBioHCsJRXluIExAZRMaDeJaZ3DgO01qJxEmRndcNzY
         7l1REdC4VVklMDBvERe+iyuO/B3WuL0i9MTmvhIhTE7hTsE5Cukbz4kzebAwspE+HHHm
         xTUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719247603; x=1719852403;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UdsQVLlx/h6bzQBw/PftMKrwboL2BwJ/wPUlBpBpDJU=;
        b=Br1zuKWyWp+NvbJpt1OXAA+0aGbvIvhyF0v6MpCeyydqXuHTrzvvZ/phUMxc1HwXqs
         5vrSj/1ZmIqQmgIedTf3DS9plzkzErd0FDSSEOiuIcAMIC/IaZfLYxpe+DKLvUbaMBzc
         aWx2OIO67Hjm8nWBCfv5zoPtd7v7GsPI7vkd+smz0Ixs0sWV/uXv4le8lUdQFbjlgbOa
         ShjGwKhPr1lpVBj5Jwm3WZ/mmlfeduJIlO296z+XPlJNeaM+B5WsNz14t3219HLh5n+a
         mxGfklYwAJoGMc7JDZW7lb8Wg7pmV81WRXbhQ5Wl0EezWA48NPdnqzA73g+llgU59Wpu
         SJdQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/EQ2sEAmnzHzMJzv4HV1mtVymStRSkBljEHiPzXyTt3AXjyay6bqUJO2JdwLBRWAJPMCXYpcmNXsDWEAgsEOiZ04a/7Lquvcf
X-Gm-Message-State: AOJu0Yz2xSzYYsH7OU3SmHcjDFhhdgg14tWui4pqFg7p8/TXg3zj48I5
	uhzHhx8WTYoK1P8DbknAwj7zUoOb7hYv0Rm/frzpGHZ+03SF+rqQrXWIuKKKnMU=
X-Google-Smtp-Source: AGHT+IEeKvPzfyNwPxeUyUIk7sVc3A7I3ZiIk2CwSjDSZ1RvoC7EvcXrLGH4uX/AhGcrQmx9KSgf9Q==
X-Received: by 2002:a17:907:a809:b0:a70:7a10:de0b with SMTP id a640c23a62f3a-a7245b565b2mr352681166b.21.1719247603444;
        Mon, 24 Jun 2024 09:46:43 -0700 (PDT)
Received: from localhost (109-81-95-13.rct.o2.cz. [109.81.95.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7213f474e0sm273562966b.190.2024.06.24.09.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 09:46:43 -0700 (PDT)
Date: Mon, 24 Jun 2024 18:46:42 +0200
From: Michal Hocko <mhocko@suse.com>
To: Waiman Long <longman@redhat.com>
Cc: Roman Gushchin <roman.gushchin@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shakeel Butt <shakeel.butt@linux.dev>, linux-kernel@vger.kernel.org,
	cgroups@vger.kernel.org, linux-mm@kvack.org,
	Alex Kalenyuk <akalenyu@redhat.com>, Peter Hunt <pehunt@redhat.com>,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH] memcg: Add a new sysctl parameter for automatically
 setting memory.high
Message-ID: <Znmi8lfORdPoI061@tiehlicka>
References: <20240623204514.1032662-1-longman@redhat.com>
 <77d4299e-e1ee-4471-9b53-90957daa984d@redhat.com>
 <ZnmO8izZPwYfiaRz@castle.lan>
 <d97e2e8f-0abc-49a7-bead-0501c1226040@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d97e2e8f-0abc-49a7-bead-0501c1226040@redhat.com>

On Mon 24-06-24 12:33:27, Waiman Long wrote:
> I also trace back the OOM problem to commit 14aa8b2d5c2e ("mm/mglru: don't
> sync disk for each aging cycle") in the MGLRU code. So setting memory.high
> automatically is one way to avoid premature OOM. That is the motivation
> behind this patch.

Please report this.
-- 
Michal Hocko
SUSE Labs
