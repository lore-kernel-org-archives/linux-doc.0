Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7089E2040AB
	for <linux-doc@vger.kernel.org>; Fri,  8 Aug 2025 07:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754636442; cv=none; b=hoxJuJQoIjV+lh+E1STtxwxegDE8pNz8Tx0qjrZ6N7ToU3vsi4QUNyBfywJrCXDLXrJr8aDomMwkXf9vaEW26aFOq/BpG+GZKg23E4pT8sEc53+uMyjDil9v3hr10JYAj6Mv4LtdY1ThvVDjbCamA6wm1C634poS+Nauyo7NY/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754636442; c=relaxed/simple;
	bh=EVo3hfbeuPKUpx3HiKtclFoPoJrpFgA+aUM1ynHlZmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LFN51PGuNfEc2oVFwXvQ/aBIPBbb06G1jrS7E74kUtGXsSRiyBNjNmTdDPSd8//JevQDW4IpsXVSk8wivSXZ89Fi6UeogSAPu5d39Bf9jhJD44HbINKnUMZNpBfrwU1iVlK33b4K2fQa6fg8kp1Dx++k47OBa4uwQlOXUNMzIuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=H8OuczV5; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="H8OuczV5"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3b7823559a5so804779f8f.0
        for <linux-doc@vger.kernel.org>; Fri, 08 Aug 2025 00:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754636439; x=1755241239; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pVEu9GErkIXG3eJ2AqWu2ENhgTXDL/O6jQUo/mg7Ei4=;
        b=H8OuczV5c2frY8nzSZfjozNjQ6w5McLU6qpHfli22/7R/gH9ZJffDgFSAwkH0+JjIL
         1iWydbr4N2KJpvZD0JVYbQuhXLIyEt4zT1BGgA11CL8zmPpqX4q2qvXOWy3FSSZ3AKuU
         ntBuWJebiX+Je7fDRJG2ARR89Pzk/pHc5HwUmZapdJz2gEBySjbzEoZPXBbYVR6SfVoC
         JETKaS6SlvSvvwssKfNDTBYgU+SrqM/RnrwuQxWHJXH76R2DBTpOYYm6v4LgMq5TZyHg
         2yzSgPC8ZDyBMWKK8I9v+WZPIANkVLFG3MqFx2W8S0RqAK6HU31+BgSzwQhUzRblSV0G
         xJIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754636439; x=1755241239;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pVEu9GErkIXG3eJ2AqWu2ENhgTXDL/O6jQUo/mg7Ei4=;
        b=d8EUkhN+SFEcg+rYMbGTr6WoM1B2gpTMEdm6TNkzjPRR40k59BDnfhHGnsqEZ+QW1j
         +pRiu9tBL0oLyAtkbGSJX58AMCFluwopM2hHHEg3iWUXTe6+cGOCcIXTadpQUDj6Qlfs
         OrzQG3R58xFyPYZuFX1WcsW+7juhTVGg/CnXBTIzBh07eYQE2mh+jF6dNIlVfZs1H5rO
         QZDDZfQRLEucSj2o/WSFbIJvorgC32f9CRWLtFQdszdfqdwK9Qk9T9Hvg6CZkhybZAW6
         N6rDbknii61JZxkSwph2HPldIKRBpLEa3Fs1exy7puxSjY9PhxbfCBLI+gZxmazettTg
         a9UA==
X-Forwarded-Encrypted: i=1; AJvYcCUzsVnZ8cDxH+45C7NEmVRpvoDphs8vsYrMttPb3XnsuVTiHDKHEZEiqoUtAkjYRiwZ16SEMO1yupE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxB7LoPzofFhl972Of68KUI9ICGdf6fqz5Mm6HL09qF65cOY/ns
	3sQyNwRu1XxS6Z2P84zwQmIir8PaOazgZR9OX6ThGbhyN7HwBYqJ9dDuVELLJa6vXgc=
X-Gm-Gg: ASbGncsAs0rNOIgWzA7hECD7axNHU3gCCY4YX+3x09Fb9Ms9dir3wEwkc9DJdakrUkB
	dYUvsdRLfhX33i78nCBSv9kECXNWHyOaedcooCli/Jqr5HaK2LeLyHg7/UN3JE4ceKR9zixmWSl
	/YNjreWt4DW35zer24kK8Fqt2CY68w31VKll23K7ZMrPcDbxemwvkoDgoYTrzyqipb0mBC9XoqT
	ap6WQc4SoiX2qxAsK8wfBn4YokIQUFdq0LDH9X2KbH6sTjBekm/4GTvEiqF/P3HL8Gwf+cWMzoX
	bvNxylTzfse5L7aISWXw0eE+ajgS0U3HqP9weydKY+leGogQqkqBIeMGT0GI2LLmo2Pxew8ul/e
	vIiPMG4gDYs+tj0VHGtjF76ZS2fOmUljsAYs=
X-Google-Smtp-Source: AGHT+IEJk4yevy9+HAy0KW8ZE8r8h3He+ydCFV/7Q/AXZWGxTkl97mbZhRDgapiuoxoRlq32dlvmJQ==
X-Received: by 2002:a05:6000:400b:b0:3b7:7cb5:a539 with SMTP id ffacd0b85a97d-3b900b2baa8mr1256578f8f.18.1754636438515;
        Fri, 08 Aug 2025 00:00:38 -0700 (PDT)
Received: from localhost (109-81-80-221.rct.o2.cz. [109.81.80.221])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-459e586a011sm133293865e9.19.2025.08.08.00.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 00:00:38 -0700 (PDT)
Date: Fri, 8 Aug 2025 09:00:37 +0200
From: Michal Hocko <mhocko@suse.com>
To: Zihuan Zhang <zhangzihuan@kylinos.cn>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Oleg Nesterov <oleg@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	len brown <len.brown@intel.com>, pavel machek <pavel@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Nico Pache <npache@redhat.com>, xu xin <xu.xin16@zte.com.cn>,
	wangfushuai <wangfushuai@baidu.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Jeff Layton <jlayton@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
	Adrian Ratiu <adrian.ratiu@collabora.com>, linux-pm@vger.kernel.org,
	linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1 0/9] freezer: Introduce freeze priority model to
 address process dependency issues
Message-ID: <aJWglTo1xpXXEqEM@tiehlicka>
References: <20250807121418.139765-1-zhangzihuan@kylinos.cn>
 <aJSpTpB9_jijiO6m@tiehlicka>
 <4c46250f-eb0f-4e12-8951-89431c195b46@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4c46250f-eb0f-4e12-8951-89431c195b46@kylinos.cn>

On Fri 08-08-25 09:13:30, Zihuan Zhang wrote:
[...]
> However, in practice, we’ve observed cases where tasks appear stuck in
> uninterruptible sleep (D state) during the freeze phase  — and thus cannot
> respond to signals or enter the refrigerator. These tasks are technically
> TASK_FREEZABLE, but due to the nature of their sleep state, they don’t
> freeze promptly, and may require multiple retry rounds, or cause the entire
> suspend to fail.

Right, but that is an inherent problem of the freezer implemenatation.
It is not really clear to me how priorities or layers improve on that.
Could you please elaborate on that?
-- 
Michal Hocko
SUSE Labs
