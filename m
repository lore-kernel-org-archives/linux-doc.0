Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5D31714A4;
	Wed,  9 Oct 2024 20:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728506097; cv=none; b=jLR3CRUHYpQTjZEZiymDgEVOZYbEsMk4voMB9JRkUYGLMz47U1jsoPqWEEvVNrCQYCgTBkLoVG9n5s2U7S+2RT7qjEui08qYIpRaGLOkfVi0djEpk+aCuqqYo5nxTaqbMNciBcqxaEe+lHox0typ/A3IG7O0zFMQBlL7MD69Y9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728506097; c=relaxed/simple;
	bh=qt6O4TFup6l2Hiu5AxCdTSn2l50AeT3gR5vPwM87zqc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hIpyLTxmz99kSfr9ApA3ZEQMvfE5qLBAaN8VZoWZwlfj3Uj8yx+rQ3nMqJptSvxlTmc5mIlhC5P89wJR7uC/7ZjVvtTtfTf52TknXYZM5FGHy2Jli0ByXrWDy62ut6tsCxG6VvpvH9loKxeKu4XSMKcUZ1uTVNrjOynH1yE25Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hW3mCtvU; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hW3mCtvU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728506095; x=1760042095;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=qt6O4TFup6l2Hiu5AxCdTSn2l50AeT3gR5vPwM87zqc=;
  b=hW3mCtvUCFKg4m4gGhAcig+aTXbIFrtPgqSYI2TqudSZY2jKyqmuhJhQ
   FMJqUP8ImyxCnKGBE+eFURk8qrHwGfYLcSPfpFA7s/y5pDA18qcyoZX8s
   YZjIRRHoJwMCdXq/zlX4xXpj4CIJmRIOuBHoKpFn3PFWDu3ojf17l39tq
   NCTiXnyM47JQMCw2IZ6JsLlgBdkwr6YnwBP3lWmVKajdeZyxdpQcQZsCp
   7wgV9jSSpt3ommy1P4C0ZKrgtwjEIl3UnRqnr4SguSwi97mg9b8pISIWd
   JAdakokswEhS3tEeMAWu2VHSCWT6p2OhDWeonr98hoFiDmMutL2O+5bHy
   w==;
X-CSE-ConnectionGUID: TKssQWXfRf2xFgverFoDdQ==
X-CSE-MsgGUID: nMPi65CMQmqGP+OQYfUDOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="15454535"
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; 
   d="scan'208";a="15454535"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 13:34:54 -0700
X-CSE-ConnectionGUID: qGvKCha/QXOfx5bwKqeUgQ==
X-CSE-MsgGUID: FCIqEx2tTIufV7RB2QEYug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; 
   d="scan'208";a="76842358"
Received: from yaaguila-mobl.amr.corp.intel.com (HELO [10.125.83.153]) ([10.125.83.153])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 13:34:54 -0700
Message-ID: <0db4dd0a-61c7-4e04-ae8f-38d7e720ebe6@linux.intel.com>
Date: Wed, 9 Oct 2024 13:34:52 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] x86/bugs: Create single parameter for VERW based
 mitigations
To: "Kaplan, David" <David.Kaplan@amd.com>, Jonathan Corbet <corbet@lwn.net>,
 Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 "x86@kernel.org" <x86@kernel.org>
Cc: "hpa@zytor.com" <hpa@zytor.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "pawan.kumar.gupta@linux.intel.com" <pawan.kumar.gupta@linux.intel.com>
References: <20240924223140.1054918-2-daniel.sneddon@linux.intel.com>
 <LV3PR12MB92651F4DF654C886B9F2BCF7947E2@LV3PR12MB9265.namprd12.prod.outlook.com>
 <879b3437-c706-47c4-b1aa-b2def940f569@linux.intel.com>
 <LV3PR12MB9265A30309277CBB4A9B81D1947F2@LV3PR12MB9265.namprd12.prod.outlook.com>
 <7c1de6fb-fa83-47bc-a57b-e6700860513d@linux.intel.com>
 <83686f5b-7957-432c-9e2c-d54e381c06c9@linux.intel.com>
 <LV3PR12MB926551F0A89B3C7B6209F3A4947F2@LV3PR12MB9265.namprd12.prod.outlook.com>
Content-Language: en-US
From: Daniel Sneddon <daniel.sneddon@linux.intel.com>
In-Reply-To: <LV3PR12MB926551F0A89B3C7B6209F3A4947F2@LV3PR12MB9265.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/9/24 13:02, Kaplan, David wrote:
> [AMD Official Use Only - AMD Internal Distribution Only]
> 
>> -----Original Message-----
>> From: Daniel Sneddon <daniel.sneddon@linux.intel.com>
>> Sent: Wednesday, October 9, 2024 2:44 PM
>> To: Kaplan, David <David.Kaplan@amd.com>; Jonathan Corbet
>> <corbet@lwn.net>; Thomas Gleixner <tglx@linutronix.de>; Borislav Petkov
>> <bp@alien8.de>; Peter Zijlstra <peterz@infradead.org>; Josh Poimboeuf
>> <jpoimboe@kernel.org>; Ingo Molnar <mingo@redhat.com>; Dave Hansen
>> <dave.hansen@linux.intel.com>; x86@kernel.org
>> Cc: hpa@zytor.com; linux-doc@vger.kernel.org; linux-
>> kernel@vger.kernel.org; pawan.kumar.gupta@linux.intel.com
>> Subject: Re: [PATCH 1/6] x86/bugs: Create single parameter for VERW based
>> mitigations
>>
>> Caution: This message originated from an External Source. Use proper
>> caution when opening attachments, clicking links, or responding.
>>
>>
>> On 10/9/24 09:39, Daniel Sneddon wrote:
>>>
>>>>>
>>>>> Are you suggesting a name change away from "clear_cpu_buffers" since
>>>>> it is clearly about the mitigation rather than the bug? I'm not sure
>>>>> there is a good common name for those 4 bugs that isn't about the
>>>>> mitigation, but I'm open to any suggestions.
>>>>>
>>>>
>>>> Yes, I think that would be better.  I wasn't sure on a name either.  In the
>> RFDS webpage I see it described as "similar to data sampling transient
>> execution attacks".  Perhaps something like that could be an umbrella term?
>>>>
>>
>> data sampling feels a little too generic. How about something like
>> microarch_data_sampling?
> 
> That's what MDS stands for right?  Might be too associated with that one issue.

Oops. Right. I'm so used to the acronym I can't even remember what it actually
stands for! :)

> 
> Maybe transient_data_sampling?
> 
That'll work! Thanks!
> --David Kaplan

