Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A119435CEBB
	for <linux-doc@vger.kernel.org>; Thu, 11 Sep 2025 17:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757610501; cv=none; b=NSeRgU2rMxJICnLCEmtc0ExgzwdP+8hUeWzw6xTEoj4l5W/36MDnSeZiIFi7hxxiqWYhO1QgP1mFm8waJIAWAJqmAjtthUWG/85Vwr7KS30lGQx+CofNeIAnrTuYtxE3+gdDuXMKsC4e4A1+vik74hij+YPyrrr3t3Md8jfZ66A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757610501; c=relaxed/simple;
	bh=rrP7YnwH/IAjRl+5DLVAVWNnRqo/qKVT+Hje3JGkSIc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uflE+jxM7re2W6xDF9hJkTJYtjYR3WFehkmCutTTVXBo2L++w5GS7cefeOY909G8A4n0iNcrBaP4tJsbwWmS3MoA6fT70QDPrh69+D3g+bVFR5ia+2ugjvnV6PJviQv3woatkG5vk7Foj+V0bUl59OycdoEDYS4nwDNLJB+iX/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VLWybwoC; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VLWybwoC"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5607ac8320cso136847e87.0
        for <linux-doc@vger.kernel.org>; Thu, 11 Sep 2025 10:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757610498; x=1758215298; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XYWrG/z8ntkohSELJJmfw5BJR4ViX4520Shju2hmuss=;
        b=VLWybwoCHmaNf6fDCoEZffR1qTKowZy8BZUrdPcJAd8w+AxjKLqhSsRZhZOzOUDc6s
         CVFNuLVdEwvX2qtAJfhzBH1ZfOpDNFD+OvHpbVWdiYFdPNUtmnW/uWdqg47mvLWwdNI2
         Qia49z+rwueKND6XkAlNWdD25cwVXrXOgpqRO3wOuZo7rStFjU/a7BSjSCzWidLr2U4U
         DbWKZdCtBaj6MVsM822NWDA/PMWahxdRjAKhlC03KACcJiGILlttWcQDVeu+okZKkfG3
         7pmWSrNo+pSLhDYawnKAB5oeKQo3Agd0zqGjOl6Ewy0mphqXP5+JoQUXfJbaIvT+5K6m
         XyZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757610498; x=1758215298;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XYWrG/z8ntkohSELJJmfw5BJR4ViX4520Shju2hmuss=;
        b=d79GPoVdt5ODPYjTyulai4RfOe4XmvDxXEwbJbfWjhumcJVwql8uBwOFutWCfDtznB
         5xApbldxcgqZyihgIs+5CLJ8jJDxBWOVqiRIW/TYpxo77wxVUvU+4m5KpR+GAinm1Mi/
         RgpiS2yvkSGO+X4nQg4yEKZ9TZvYneHbJYdqZJiQnFdHCTogx2LSImADdxsKXWkC3XVh
         xUtYYsvgyv453HR8H9EwqEQ6npOK1Cu2qmqxRqQm/WBvcwrIA4nEpjgKpTuUp/DYxLkg
         E6u2ESnzATODP3HJzODa60nz2H1zS+2rBTc4nq4UVBVzA61C66zY5KH4he9SbqD9/BQb
         8scg==
X-Forwarded-Encrypted: i=1; AJvYcCUgWdsfI4jJEhHgd5uIl7/vqyFyjgd7t0SVfz3kT0u14XF37ICnwPLPKBtGL3cZoFgqWRV/h6tQIJw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcT4giqCNQn55XEidXXJRfh8fLAiHYEkio4HGVx+CDc51MoLqC
	Vw39IqdcyjX/GFkqe+xowZbRs4OMk8NFw67yIQrhYg3ZAebJLKSWUkQs
X-Gm-Gg: ASbGncvIOg9BTep0yP9+GzBX/dnrYpoFTIWmtu9h0lm7Ue0SUJGP+juCLA9xrP/4woY
	TK+copZMcf962sfdRu3jlSm2FO+YV/jEuy8VVaEpVN2rFomXEJYNDbmzPtzOPZnHJdUMgk+8QHQ
	CDiFq9quAgny9xgQoO7quoV5bqRVUksnmqRHOkLSXPP7KaFbpgyeKinM0+JgTeeUgnCiPoYfB5b
	2v9Bg2TIoml7JqIkk8+GzkJkblX0cw8hJjZbeFHTfAhqQIVDWvmT5LQ95J2msnyZgIM86BTv+My
	PYrXyDPIOKRlKs6MwZS5cWH0Wz+/dBQiru8v0i9/QoEHzIFwQK1LJDVV8VNVVyDxVpwOT1muXh9
	LXq2DoqZOIlZKiFBkeIDIXpTO6Vjk5xc2H3O1IC8=
X-Google-Smtp-Source: AGHT+IGkRq1b+XclvjAfbrp2HdIg4dj29v/UCbMXdq6x0LUwuyY9G012qPLCEJ36wPGT4HRWuf5+Cw==
X-Received: by 2002:a05:6512:220f:b0:55f:7066:ce94 with SMTP id 2adb3069b0e04-5704a8b3a0emr33427e87.4.1757610497376;
        Thu, 11 Sep 2025 10:08:17 -0700 (PDT)
Received: from [10.214.35.248] ([80.93.240.68])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e65754a7esm516306e87.131.2025.09.11.10.08.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 10:08:16 -0700 (PDT)
Message-ID: <d74e67e0-2ba7-4af8-a207-132ba634781c@gmail.com>
Date: Thu, 11 Sep 2025 19:07:44 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] Documentation, kstate: Add KSTATE documentation
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Andrey Ryabinin <arbn@yandex-team.com>, linux-kernel@vger.kernel.org
Cc: Alexander Graf <graf@amazon.com>, Mike Rapoport <rppt@kernel.org>,
 James Gowans <jgowans@amazon.com>, Andrew Morton
 <akpm@linux-foundation.org>, linux-mm@kvack.org,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Baoquan He
 <bhe@redhat.com>, kexec@lists.infradead.org,
 Pratyush Yadav <ptyadav@amazon.de>, Jason Gunthorpe <jgg@nvidia.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 David Rientjes <rientjes@google.com>, Pratyush Yadav <pratyush@kernel.org>,
 Changyuan Lyu <changyuanl@google.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, Chris Li <chrisl@kernel.org>,
 Ashish.Kalra@amd.com, William Tu <witu@nvidia.com>,
 David Matlack <dmatlack@google.com>
References: <20250909201446.13138-1-arbn@yandex-team.com>
 <20250909201446.13138-8-arbn@yandex-team.com> <aMDMHx1spjeETKK4@archie.me>
Content-Language: en-US
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <aMDMHx1spjeETKK4@archie.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/10/25 2:53 AM, Bagas Sanjaya wrote:
> On Tue, Sep 09, 2025 at 10:14:42PM +0200, Andrey Ryabinin wrote:
>> +There are _V forms of many KSTATE_ macros to load fields for version dependent fields, e.g.
> 
> Escape the trailing underscore (i.e. KSTATE\_).
> 
>> +Addition of new field can be done as version dependent field by using _V form of
>> +KSTATE_ macro:
> 
> Ditto.
> 
>> +Subsections
>> +-----------
>> +Another option is adding subsection to kstate_description. A subsection is
>> +additional kstate_description which linked to the main one:
>> +
>> +struct kstate_description test_state_v2 = {
>> +	.name = "test_v2",
>> +	.id = KSTATE_TEST_ID_V2,
>> +	.fields = (const struct kstate_field[]) {
>> +		KSTATE_BASE_TYPE(i, struct kstate_test_data, int),
>> +		KSTATE_END_OF_LIST()
>> +	},
>> +};
>> +
>> +struct kstate_description test_state = {
>> +	......
>> +	.subsections = (const struct kstate_description *[]){
>> +		&test_state_v2,
>> +		NULL
>> +	},
>> +};
> 
> Sphinx errors out on struct snippets like above:
> 
> Documentation/core-api/kstate.rst:17: WARNING: Inline emphasis start-string without end-string. [docutils]
> Documentation/core-api/kstate.rst:17: WARNING: Inline emphasis start-string without end-string. [docutils]
> Documentation/core-api/kstate.rst:21: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
> Documentation/core-api/kstate.rst:28: ERROR: Unexpected indentation. [docutils]
> Documentation/core-api/kstate.rst:32: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
> Documentation/core-api/kstate.rst:33: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
> Documentation/core-api/kstate.rst:84: ERROR: Unexpected indentation. [docutils]
> Documentation/core-api/kstate.rst:100: ERROR: Unexpected indentation. [docutils]
> Documentation/core-api/kstate.rst:102: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
> Documentation/core-api/kstate.rst:103: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
> Documentation/core-api/kstate.rst:106: CRITICAL: Unexpected section title or transition.
> 
> ...... [docutils]
> 
> reStructuredText markup error!
> 
> I have to wrap them in literal code blocks:
> 

Thanks, I will make sure to check that the documentation builds next time.
