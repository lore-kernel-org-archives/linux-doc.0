Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F195C230BD9
	for <linux-doc@vger.kernel.org>; Wed,  8 Oct 2025 14:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759933117; cv=none; b=P3FXUynjIEupB4YoWruroyS/CAoDk7fhW5kXKIV833XAEd5gz1icpFo+dRfKOwamQJ3HECmYztWufdYMGqSztE5xOHbSMfXukpPV6NNjqWjp3eDGetWYB2PYJPkEPwtrk0+wG08jjkmR+6EUJsc0swR17i/4KY04ndQIbuSO1Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759933117; c=relaxed/simple;
	bh=dBoanlnE/kFlixsj+N7u+C4Z7KMpeDGfloepU+PPEJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SfCp67z6J1sJRRmmeBIUJUs9nAMFz+aUIqlHTcvrbQ9DKEi6unkrbCxriJ8qLCzrr3m/YmSGOCxfrQCF5sXrRgbIsusdNLMqd11oFLxRoidVPMBcMmw9ic1CcCY/GpqsWjZQHZdnNvASo9DREHYQSMgH1mv/YEceUFdyjhMK1yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=VHdp7bKL; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="VHdp7bKL"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-87a092251eeso11178446d6.0
        for <linux-doc@vger.kernel.org>; Wed, 08 Oct 2025 07:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1759933114; x=1760537914; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5QJIQKG0sT9rZgBfipH2pnXvFssK3HlZCOf/vlaj8bs=;
        b=VHdp7bKL5g0CKP4voEaQfrlOikUGCd05QtJgxrMmnjfDrYVx+58R+IbJucANt60AQ+
         lMslHiMZzbHODXxDDECSjFgdYdIJ9GyVPqj0wRLRoew4NGIgSBu/+LlDa4HzEXdDuICy
         NWZ9SqWKiqhTfnxagGH6OmthmCmYVLw7TI+sFFdq0HBbCIKKmx+a0v+9rJaMFJr4RNn6
         1JpeWYK/sQ4aZWokfoxPx6AvAKuX87QgNRo0FZGLe5IFDqSPAtCuQMfhMvofVEoKU6et
         EPHXCTXJUJJWxfOFNhUYgnrWwr6EGcJyJZyyHOHw2IzdVDHVFvWJm6JuTmS1q4gPDaW5
         Ehdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759933114; x=1760537914;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5QJIQKG0sT9rZgBfipH2pnXvFssK3HlZCOf/vlaj8bs=;
        b=PyB5+R2rJ8h2zeXT4HC+5ICng/mNV26IN5b76vrDfE2cmQhHIILSOFt4x2HLGbPxO9
         ZDhtkLgMuvaesIomPNX7xdiFhCgBW9s5xtgd5cNFKaTGFn90PF7/n61n0xg7i13e/eK2
         1EfPGxs6WyHVdK36P0R9kCgTkINa66KErxqqorzTOX62OW1jsEe+QKtmRGQvruXRcj7m
         gGTFbv8ssFKvXSm+x6aKnpoG1qwbMhAhouzgIWEqGMGWkJJQKFc7PUwyifLCEjpqX3Z4
         Y3+CXnlS3wotW71SSMgQHIWJrq+ehNdYETEHcns4iQ61MMA/Q+r9fP4BwNTgJ0GOQ6Td
         0J1A==
X-Forwarded-Encrypted: i=1; AJvYcCWKn10XZY3VhSLzdcFJD/yZ3bzlxkTlsIaWDG47+RSFAYW5PKmcpwHt2ahFlOPYaw9fYn0xQEM2ZVI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxzz3XN9Wwdooa2i60nwpCksEM0z+EBpkuj+P7hsbAgiJnoe2Mz
	ylTTX6xSOg202A/yCnrsEZ4ciki+wxVrqHMKbFh0twc5lpWbILTGrZlw1il4a4mamWI=
X-Gm-Gg: ASbGnct5SEIa1qJTHoWvAhrzFKga7+OyXsmGf3L88LHeztAyZOdKmc8rM2H9WWQzgAU
	g8L3mHzD1hhLoObrPCzrp3EM8aT8BQAx8pxn3raN8lIJ4OL/eHCC7+pLxXsdNzpZduNvCUn/+3y
	NXZkKvcBxD19xfDF+uoTXe7qEJCtdl0qq4wKCjESDxe5JNB8em2JRgCJLKpJsjcNq2MsJOu8ivX
	A6GCBgHjwk5Zit9VqqMTr0MxsMoHQXUB0Oow81gtLcbygtjE95F37HoUNRozpnyCruQHWdKdEUu
	mzGTUvSQ0+aEGBza2gOdeLcS8C7gVu8FmfyMvLbE+jdOhZ+BFbRACj3gZJ0lcZFsODu3J1mNmkf
	0tH0Ml7Emc6Abp0/Q23f5cL3F53qsx1rn7CvvbxxagrQdtHjAekVKJFYUm3opNfa+eWvpS3gAwd
	fTDon9FuKrxPqRbHboa1r4SmuJ/yTmvy7frzk5clGMNIJW9Oz3la0=
X-Google-Smtp-Source: AGHT+IFNKG/GrbiRc1bEn8TWwx08M4SbG5dcVn/TJ2EzZl4DHVGIFZ6s6jij2fTulKfOfOsdd1koyg==
X-Received: by 2002:a05:6214:2027:b0:802:67ee:bdae with SMTP id 6a1803df08f44-87a052a63a4mr114908286d6.25.1759933113566;
        Wed, 08 Oct 2025 07:18:33 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-96-255-20-138.washdc.ftas.verizon.net. [96.255.20.138])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-878bdf53134sm162645246d6.55.2025.10.08.07.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 07:18:33 -0700 (PDT)
Date: Wed, 8 Oct 2025 10:18:31 -0400
From: Gregory Price <gourry@gourry.net>
To: David Hildenbrand <david@redhat.com>
Cc: linux-mm@kvack.org, corbet@lwn.net, muchun.song@linux.dev,
	osalvador@suse.de, akpm@linux-foundation.org, hannes@cmpxchg.org,
	laoar.shao@gmail.com, brauner@kernel.org, mclapinski@google.com,
	joel.granados@kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Mel Gorman <mgorman@suse.de>,
	Michal Hocko <mhocko@suse.com>,
	Alexandru Moise <00moses.alexander00@gmail.com>,
	David Rientjes <rientjes@google.com>
Subject: Re: [PATCH] Revert "mm, hugetlb: remove hugepages_treat_as_movable
 sysctl"
Message-ID: <aOZyt-7sf5PFCdpb@gourry-fedora-PF4VCD3F>
References: <20251007214412.3832340-1-gourry@gourry.net>
 <402170e6-c49f-4d28-a010-eb253fc2f923@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <402170e6-c49f-4d28-a010-eb253fc2f923@redhat.com>

On Wed, Oct 08, 2025 at 10:58:23AM +0200, David Hildenbrand wrote:
> On 07.10.25 23:44, Gregory Price wrote:
> I mean, this is as ugly as it gets.
> 
> Can't we just let that old approach RIP where it belongs? :)
> 

Definitely - just found this previously existed and wanted to probe for
how offensive reintroducing it would be. Seems the answer is essentially
"lets do it a little differently".

> Something I could sympathize is is treaing gigantic pages that are actually
> migratable as movable.
> 
...
> -       gfp |= hugepage_movable_supported(h) ? GFP_HIGHUSER_MOVABLE : GFP_HIGHUSER;
> +       gfp |= hugepage_migration_supported(h) ? GFP_HIGHUSER_MOVABLE : GFP_HIGHUSER;
> 
> Assume you want to offline part of the ZONE_MOVABLE there might still be sufficient
> space to possibly allocate a 1 GiB area elsewhere and actually move the gigantic page.
> 
> IIRC, we do the same for memory offlining already.
> 

This is generally true of other page sizes as well, though, isn't it?
If the system is truly so pressured that it can't successfully move a
2MB page - offline may still fail.  So allowing 1GB pages is only a risk
in the sense that they're harder to allocate new targets.

It matters more if your system has 64GB than it does if it has 4TB.

> Now, maybe we want to make the configurable. But then, I would much rather tweak the
> hstate_is_gigantic() check in hugepage_movable_supported(). And the parameter
> would need a much better name than some "treat as movable".
> 

Makes sense - I think the change is logically equivalent.

So it would look like...

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 42f374e828a2..36b1eec58e6f 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -924,7 +924,7 @@ static inline bool hugepage_movable_supported(struct hstate *h)
        if (!hugepage_migration_supported(h))
                return false;

-       if (hstate_is_gigantic(h))
+       if (hstate_is_gigantic(h) && !movable_gigantic_pages)
                return false;
        return true;
 }

And adjust documentation accordingly.

I'm running some tests in QEMU atm, but it's taking a bit.  Will report
back if I see issues with migration when this is turned on.

If that's acceptable, I'll hack this up.

Thanks David,
~Gregory
