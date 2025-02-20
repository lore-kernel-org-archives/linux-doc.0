Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE09212FBF
	for <linux-doc@vger.kernel.org>; Thu, 20 Feb 2025 16:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740068154; cv=none; b=j+XmbipU9UWHZa046VnQVuWfWYvOfJnW9s8bowArVP6D8PSoS67cjyxotaOendVgo/EqZMXyQnrGoiO8YF5NtxASlYJ6O8oyLyQNiVzxJCugGVwNyF36m/swdqQZUrKPg+gEcWEcq/1Pj5H8MzhaGPajtVxBqYCkG9dyOHIRIs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740068154; c=relaxed/simple;
	bh=sefj6hxNE4DKzJ9Uo+g0WJ+GyLGTay+PVJVsLpQlNGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J/6TsRNJLzDaQDZBpTVNbvMitvmKMKXE0RyKOPy6xHyYuGVMn849uadDPSCwUHZXGNQ+aIf3GGtXK6zFPwTAdHjsHZfCMyRuZwysAzekN+z3G0Y53e2AUh0l69wuQrPgb9k6+jjofiOIiCVTZ33OEq8p8GAknrMa2CUS9XhJW5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3vC/Fk80; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3vC/Fk80"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2212222d4cdso168535ad.0
        for <linux-doc@vger.kernel.org>; Thu, 20 Feb 2025 08:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740068152; x=1740672952; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w9z6CJ8GEmOUY+R90CcF3D8uqozLmZO9LjzSZXbDX8o=;
        b=3vC/Fk80IhdOvKFpZmfxPnW0bHmrUflAxN0K2u/wR3+KOCSVsK4jZGJvamxuKvaB4/
         uet7b2fo0gt0CdK1qkGDUEhPfzTCElqoAS3V5xgL6QNjnN+5IqVve8FrCr29HEBDe581
         rENaqGFKwqM5q3emgQzFeK2ubxxjrPryA6iPKa/TEpWl0WOJh6fh3bkRUlxmOZ4lRfmH
         IGwgJKGADtJl4MbwSZHEp3XtMoqcxuuG8DpgWiXV+1kqMUWlsk6aLSbpHLrPlA2rfRL3
         u/+4bIPxCrRkqJSgKrLgLc8XOiMg/9VFkwfgxtfp3Cj+iGDwRV4IzlFxaT4Ema/OUDTx
         uL4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740068152; x=1740672952;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w9z6CJ8GEmOUY+R90CcF3D8uqozLmZO9LjzSZXbDX8o=;
        b=UWpahA9oGKwadHmBCPzj9ATvH/0kQQLGmWCLQVaPorBfAO83Vya37T5nNe8hmP0HrR
         5qVy3ChKA/7u8KG2Vk4II/3QHGGyFzooX4n1nbACMehq28sAOeKuh+AaxG5YksgnrC6F
         qiQ5Ofbvb8ZWaIjsoQxwKqgVeBUOkOE1sKXUE9O9EPuxngRi8QnwohtFQNneNkVvwF4m
         aVBTl7T6k82xitwYipW0L7V0iMc/oE3ZRAeVt679KFlk9xqPbd1Lsq/lRer56jRYMeav
         1E0ImiX0X+0Lm8RZt/gdsYjOAUXss0WSCIt1lajYZCZiaivbX0hLl2EZaAsbJbq0pBXP
         +eXA==
X-Forwarded-Encrypted: i=1; AJvYcCWAAEN2b7z8kinF7PBw0AUh/g+cDm8rSJD86UHTPh+nR8G+GLIz4FuwaRAjbA2OYgWrUjE6AKi5ZNM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwN3QvGurhxA4GqHRKRluPNRoTApScafWUfodP1nNf+lMBD9fwx
	hL/1SGCeYjNryafh8MEn5EtTvTNhdsmAhZWDPWBzRw2K1w7m6/BFmNsJD5WGew==
X-Gm-Gg: ASbGnctHHSuUA6xNToRO5lQ9jmC2m2CLjrPokMB3c9ra17AxWCa9bqq5/hAT4QEHKRA
	C6vKhGcQ6MA0EEykuKnkfPXPHhAqOrikKh5dgqazzKxraH1ecqq/0VJXq89rpaY/ceuChL/J2Ka
	27v8OrIRl97bVUmSUJeUZngvLF/pTtl8ETCBGBCuO9iIRR0TxVz8FoDM9e0bm4H8EwtI/hK8DdO
	1T5Upafxq8KHHDRTt/8JagCja4CHA2QBabgCWhMZ7dCBqnv+sjTHImyAf/1yqVmXwHcFd9zj7DC
	s854vkOxkf+4R4gFV8VrYMDsmXhzbacZJMujF8lmK1WiLmvkJElf
X-Google-Smtp-Source: AGHT+IEeeNO5YXG4GrTFzHJDa5KXpncdRPcsXRbYIZYGBm4w3MV78t3++PWrZwNmDnY5dth9MgRnnA==
X-Received: by 2002:a17:902:dacf:b0:21f:3e29:9cd4 with SMTP id d9443c01a7336-2218debe8bamr3119545ad.20.1740068151245;
        Thu, 20 Feb 2025 08:15:51 -0800 (PST)
Received: from google.com (169.224.198.35.bc.googleusercontent.com. [35.198.224.169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fc7e9325fesm8522382a91.46.2025.02.20.08.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 08:15:50 -0800 (PST)
Date: Thu, 20 Feb 2025 16:15:40 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"will@kernel.org" <will@kernel.org>,
	"joro@8bytes.org" <joro@8bytes.org>,
	"suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>,
	"baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>,
	"shuah@kernel.org" <shuah@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>,
	"jean-philippe@linaro.org" <jean-philippe@linaro.org>,
	"mdf@kernel.org" <mdf@kernel.org>,
	"mshavit@google.com" <mshavit@google.com>,
	"shameerali.kolothum.thodi@huawei.com" <shameerali.kolothum.thodi@huawei.com>,
	"smostafa@google.com" <smostafa@google.com>,
	"ddutile@redhat.com" <ddutile@redhat.com>,
	"Liu, Yi L" <yi.l.liu@intel.com>,
	"patches@lists.linux.dev" <patches@lists.linux.dev>
Subject: Re: [PATCH v6 14/14] iommu/arm-smmu-v3: Set MEV bit in nested STE
 for DoS mitigations
Message-ID: <Z7dVLNLhP7VfZ-Ph@google.com>
References: <cover.1737754129.git.nicolinc@nvidia.com>
 <436ac2021bb3d75114ca0e45f25a6a8257489d3b.1737754129.git.nicolinc@nvidia.com>
 <BN9PR11MB5276291C74E2DF0C8821BE718CFA2@BN9PR11MB5276.namprd11.prod.outlook.com>
 <Z7TOq-gIGPY_ztW7@google.com>
 <Z7TXQ9EdyvHp/lmD@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7TXQ9EdyvHp/lmD@nvidia.com>

On Tue, Feb 18, 2025 at 10:53:55AM -0800, Nicolin Chen wrote:
> > > Is MEV available only in nested mode? Otherwise it perhaps makes
> > > sense to turn it on in all configurations in IOMMUFD paths...
> > 
> > I think the arm-smmu-v3's iommufd implementation only supports nested
> > which could be the reason.
> 
> I guess what Kevin says is that non-nested STE should set the MEV
> as well, e.g. BYPASS and ABORT, and perhaps stage-1-only case too
> where the attaching domain = UNMANAGED.
> 

Ohh okay, got it. Thanks!

Praan
