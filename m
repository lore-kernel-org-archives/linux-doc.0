Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795681847;
	b=vCpZ/CFdpTe3LFIlBtsx/CopLLabXncQ/okWH3j/uZSmMnCDflz5VoIJYmNSMxg7U8so
	 9TmWNuhYXNqrHd94yLU++infuHual0owyrTVybPVapAFjUSfuXgIZS9iwCC/GAZI+VDhV
	 27sv2MIIiPlLSWIkJbds8pH8SVM01Xa1t8VhoEkYUsOaNXIWWrUKAOnPE/jVFyvIcqiyE
	 fLhnDyKFsfZvTkapECDJFdHkojTUnttY3r4LVlhnF+Jp0bosBI2os8FnAbL6Ztv7SJR+5
	 Nj7rsJYNHiIDexMkCRCTDPUGoGa6VQkoPNV2CvS4CiRuiK6L7Cs7WZ87WbVV+yz76ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795681847;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=FyyIgAo1e3KK4/AdbdpOK9l3019Yj2VAw+xdIQTmPhE=;
	b=2hXwp+gHWtajvsYP6/e0JjWw3IStfnj2hWS77eL4Sok06oahQP/CLdG7pZLgRn5cYxn2
	 fFBecgmUKEkbVCXbSytA4QSYS0Cmy+/zLWFfKxPbhJPSnk9vUkMoJL/qCqZarqEPonEVW
	 YAMP7BdQLlhe45noDZlSqrwmgWW1JT+H9ITc/FOb1her5WAasPQwZ+FxWPWW6ThR7ewLV
	 PW0TlrsSjUw7CMBZZ0REXGSsV+8YbpNZTAgN+5KRJS9vhtgqj9JjUk9Oc3cNQX1pazrdA
	 y6AqTgSNns+HPIyjagpbghsBFWSmddE5wvdRxQAcnBhlcxtH5ld69mzMMYeC4ZAu+pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="eCg/fjps";
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E5E606A31E
	for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 08:30:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43E5E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=eCg/fjps
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb9d8e8e90so38364465e9.3
        for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 00:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795681845; x=1796286645; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FyyIgAo1e3KK4/AdbdpOK9l3019Yj2VAw+xdIQTmPhE=;
        b=eCg/fjpswoW70jdAY+mfyk+zh8A7sPtwN0ZOj8XcsYLfY+IxN4rBvfAZo9jTNIV4yZ
         huKQSVldcKpLTjcvTpaEWhW6eYIR50k6YD72+/5ObME9AznGZVEzvoBsnXkrVaJPSLni
         lL2L6HInflOQoLQaYcb5QKVNWEqDcJ0hbeRYjhMjRajEg1SidC2tG2rn9PBzBZGNIY5r
         6vIobqG0eHeYJ8rWh59B5yxLh48EecZeZ+1rDwojXF5y07/F8vhZnh3YOFOvefR99QNr
         lfwo/rFhAH019qI9tydDvcnnbqT6JqLmm00sBYhgsldbCxjW5CYrx6Ah3BaRm4NTptol
         52tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795681845; x=1796286645;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FyyIgAo1e3KK4/AdbdpOK9l3019Yj2VAw+xdIQTmPhE=;
        b=qcEBw7CWeZyItvEjBkKPj0hDMH0UaZI8TBAag6wyIMXEXXYsX/hKc8xlZM6EMC+5FU
         C/EUvd5KowcKUsE+VeStaCgIX4ToY0LFZwqFfYfTzcz696cWwvqvSnnSgu6GZ3RHCD71
         URxLbwGz5BWtblHZHyK/36fNTR9g7a+Y00x9oOrtIcqClMvm1fCKUg2rLqOVtp2zW6MN
         4ZM2MNPcDApdpPHlhZLlPdt9sIxDx18Ha2XKMPBlocT073eCnkpvp3ZvXdzuQFkBM0jV
         6ODMJMCVlX62AcQSKotRppgo29ut3F0jpwkYFehcHdrhhMorIyPpR7qi52yq3yAKvdcy
         kOCQ==
X-Forwarded-Encrypted: i=1; AL+hErERSNkOOuN/nKfwsJtGIh9htRFiAVFNtjU0JPnM+rbiQVlFgK7uG54TPKcqOk7jQghZw3jl4ndZoy4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0KZvg8FdFXCsB8RbxJcO55RQ33QBJfTQGp7jpbi0uFfYjzocA
	xHCxo1Blp5cp/Tfa3WjK3qBOoaB1On4VnMjHurZV9cfsjIkSEm7+xnVbhEODs/blPYY=
X-Gm-Gg: AZFdTZdCr2injLnDPikLs7kNHupp4Ja97V6wuiL0/fTKQ7lhWmFI0fEt91tNn4yLpcS
	eaEtBXBcq+3dx7CxEbNSpvrWkj7wNVCna0JtIQFNGVe4iJt4m6M74L68w/vsCQykznUihHxQOMG
	pGJcPza5Uwd5DxLyobkrLdkxR3rOID3h2reGqPgX/A1dXQhg6JTPmNw4Rk2LZLt/1vBAHqjD83Q
	T+Y7BVejHjE3FUbGJmTNZfL9TV0wrQv8PA9QH1hjK3Grx3lssih6Rl8stPwKwKPYch8NziTBpyO
	vyCJ/PEIP77PD6gaDY0Fu1lKGzV4Lk1S1aWqxICDtnc+sA2gmz78Qc/iO3Rfhb0b7eiqla74y/q
	CdABpfRuc80/c6tUUD1nBHZWhq068o3g9OzCfVaLqt1ZiDCv6ZDICrI6FBysENctGHKbdhBnsCj
	+yqZ6KyOVr0Oz6e2v2s0MMBkjNWs4brq34TEvBCWEp6J2XSw9LprKzEnVk8cYgEA4tjfDrqpuEU
	zDIy9rLrYEj+lwrTllnqkXKfKQNmjX3xRGz1N8gv1AfSaMoWoR8fBw1B/PterqioLFirM/vGycl
	vRw2lN0F3quJsAwQgXFk2iUbOsuUTQJW6ifo6yy2
X-Received: by 2002:a05:600c:6219:b0:4a1:d087:f6ab with SMTP id 5b1f17b1804b1-4bb8880badfmr388991925e9.18.1795681845543;
        Thu, 26 Nov 2026 00:30:45 -0800 (PST)
Received: from localhost (109-81-21-11.rct.o2.cz. [109.81.21.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bba3d3679bsm61507665e9.2.2026.11.26.00.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 00:30:44 -0800 (PST)
Date: Thu, 26 Nov 2026 09:30:43 +0100
From: Michal Hocko <mhocko@suse.com>
To: Xueyuan Chen <xueyuan.chen21@gmail.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>, cgroups@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH] mm/memcontrol: expose anon and file reclaim statistics
 in memory.stat
Message-ID: <awfuM7vj5Vyb6Fjb@tiehlicka>
References: <20261124-memcg-reclain-stat-v1-1-c6cb14b0d917@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261124-memcg-reclain-stat-v1-1-c6cb14b0d917@gmail.com>

On Tue 24-11-26 15:51:27, Xueyuan Chen wrote:
> The aggregate reclaim counters in memory.stat do not show how reclaim
> is split between the anonymous and file LRUs of a cgroup.
> 
> Expose the existing per-memcg scan and steal counters by LRU type so
> userspace can measure reclaim balance and efficiency when evaluating
> reclaim policy. Report the same counters per node in memory.numa_stat.
> Both files report the counters in base pages.

We have found these stats quite useful when debugging issues at the
global level many times. So I think this is a useful addition to memcg
stats as well. Especially when we already collect the data so this is
purely a change to show the already available information.

> Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>

Acked-by: Michal Hocko <mhocko@suse.com>
Thanks!

> ---
>  Documentation/admin-guide/cgroup-v2.rst | 20 ++++++++++++++++++--
>  mm/memcontrol.c                         |  8 ++++++++
>  2 files changed, 26 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
> index 9e3c67b02ae2..eeeaf635754c 100644
> --- a/Documentation/admin-guide/cgroup-v2.rst
> +++ b/Documentation/admin-guide/cgroup-v2.rst
> @@ -1726,6 +1726,22 @@ The following nested keys are defined.
>  	  pgsteal_proactive (npn)
>  		Amount of reclaimed pages proactively
>  
> +	  pgscan_anon
> +		Number of base pages scanned for reclaim from the anonymous
> +		LRU. With the multi-gen LRU, counts pages isolated for reclaim.
> +
> +	  pgscan_file
> +		Number of base pages scanned for reclaim from the file LRU.
> +		With the multi-gen LRU, counts pages isolated for reclaim.
> +
> +	  pgsteal_anon
> +		Number of base pages reclaimed from the anonymous LRU,
> +		including pages demoted to another node.
> +
> +	  pgsteal_file
> +		Number of base pages reclaimed from the file LRU,
> +		including pages demoted to another node.
> +
>  	  pgfault (npn)
>  		Total number of page faults incurred
>  
> @@ -1829,11 +1845,11 @@ The following nested keys are defined.
>  	application performance by combining this information with the
>  	application's CPU allocation.
>  
> -	All memory amounts are in bytes.
> +	All memory amounts are in bytes. Reclaim counters are in base pages.
>  
>  	The output format of memory.numa_stat is::
>  
> -	  type N0=<bytes in node 0> N1=<bytes in node 1> ...
> +	  type N0=<value for node 0> N1=<value for node 1> ...
>  
>  	The entries are ordered to be human readable, and new entries
>  	can show up in the middle. Don't rely on items remaining in a
> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> index 1ebc9330aeae..ac12ff69a633 100644
> --- a/mm/memcontrol.c
> +++ b/mm/memcontrol.c
> @@ -1647,10 +1647,14 @@ static const struct memory_stat memory_stats[] = {
>  	{ "pgsteal_direct",		PGSTEAL_DIRECT		},
>  	{ "pgsteal_khugepaged",		PGSTEAL_KHUGEPAGED	},
>  	{ "pgsteal_proactive",		PGSTEAL_PROACTIVE	},
> +	{ "pgsteal_anon",		PGSTEAL_ANON		},
> +	{ "pgsteal_file",		PGSTEAL_FILE		},
>  	{ "pgscan_kswapd",		PGSCAN_KSWAPD		},
>  	{ "pgscan_direct",		PGSCAN_DIRECT		},
>  	{ "pgscan_khugepaged",		PGSCAN_KHUGEPAGED	},
>  	{ "pgscan_proactive",		PGSCAN_PROACTIVE	},
> +	{ "pgscan_anon",		PGSCAN_ANON		},
> +	{ "pgscan_file",		PGSCAN_FILE		},
>  	{ "pgrefill",			PGREFILL		},
>  #ifdef CONFIG_NUMA_BALANCING
>  	{ "pgpromote_success",		PGPROMOTE_SUCCESS	},
> @@ -1699,10 +1703,14 @@ static int memcg_page_state_output_unit(int item)
>  	case PGSTEAL_DIRECT:
>  	case PGSTEAL_KHUGEPAGED:
>  	case PGSTEAL_PROACTIVE:
> +	case PGSTEAL_ANON:
> +	case PGSTEAL_FILE:
>  	case PGSCAN_KSWAPD:
>  	case PGSCAN_DIRECT:
>  	case PGSCAN_KHUGEPAGED:
>  	case PGSCAN_PROACTIVE:
> +	case PGSCAN_ANON:
> +	case PGSCAN_FILE:
>  	case PGREFILL:
>  #ifdef CONFIG_NUMA_BALANCING
>  	case PGPROMOTE_SUCCESS:
> 
> ---
> base-commit: b024a51b0184b1efb6f55b11aaf7b15a490a6307
> 
> --  
> Best regards,
> Xueyuan
> 

-- 
Michal Hocko
SUSE Labs
