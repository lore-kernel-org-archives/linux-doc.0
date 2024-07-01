Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235E7161307
	for <linux-doc@vger.kernel.org>; Mon,  1 Jul 2024 14:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719843639; cv=none; b=s7vLTvbOY1pcfOXCKYJqOOB3mW8XMsKmOcpNnX96Q5aqN9AHo+ChBUVdyJEIqjcRMkpYX0480vtfT9GbVImIHplphaCEudjj6WtPvJX/eIX5FWh+/PY0dK/1MGjrC5oXbga6dv8WLoKNOX7HJR2I/wrii6aAqQPW9X20RvlkeKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719843639; c=relaxed/simple;
	bh=g5o5sSpyFwrehoWMeXr81zOhWZHECICawMQ/aE7jM7M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LZSaHcqrdUo/GU5Lzog9XJnCiphNTlwrL03ju6FL+3R+kERgEGx9z1EmiWTaa0NdqV8bCMpZyddNcf/cpVN2srGY3YDcOc1k4JWH8cGZmSNTwbbgGOmYDKpfEyfyRQUmkyg0bZBTZErn7X6+5om+xf0rddIqdjGKz3VQpwjwUf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=tHMGU2CZ; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="tHMGU2CZ"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-70677fe5d87so113248b3a.1
        for <linux-doc@vger.kernel.org>; Mon, 01 Jul 2024 07:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719843635; x=1720448435; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AsVBQ1nFKFlpfsD+dqYQNZ46nT8WhRUMCu1TI6qym6w=;
        b=tHMGU2CZg3FYTPSK+/fBN3SSnjTW3sgdtw3VYI9G0sXupCmXe8rc4hMs0niXpbYUl7
         Gf452mpNYimim8nt/L9w4MSx93rHtvzyXSvaKkQmCJsejypQvu/bol3x7wDReLhlQXdf
         EKrws/AvAXtwtA6lgjfpfkDOfo9tuiplQr2uRjOKEMt9JvROl+iPxkVs7Ouisw7hLyYg
         7LQaOAmCHBDAo2lKqHLya9+o3ncHVwmOeDt7MeX1vlwekvBbA5Xnn0YlSvpSvApwgxYB
         b8cU1mfHupBF+kuEuGVrKXSOJ40/oPgwKuos/y6hAQaIBRDwjXG7acsb/5WGDFMn0tCT
         Ig/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719843635; x=1720448435;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AsVBQ1nFKFlpfsD+dqYQNZ46nT8WhRUMCu1TI6qym6w=;
        b=n10xIrAqnxq+0S8WzkoYBH/Yz92c18ukQoUxPOc2OLggcwo7hhFLempD96fC7izLWb
         FePDRI/RlEJemrqE/yhghhJwMssUinixpkMFPIxV6dKWk8gS2vYbRonscQ9btTE+Exyk
         ckKHMMqinQG0Z5xesGgnW7XpMs+hbokt9lBw3ZZs57WSo6PrW7DCX84tCRqUzC3a4LIv
         +C+n/z92KKW1qlauVXP6pOI+4YlAfnsdThu5d+izLLEBl7umi0IFH8/4Fet82E7zvPg3
         faVkuU5TRkz+NBnP/4p0ltZFiO1tNwWBgQMI5zP2H2GFkuKMY4IRLNHgTAPW1j/rPqkU
         xa4g==
X-Forwarded-Encrypted: i=1; AJvYcCVFhzj5pkC6IXK+UXZE2/eZZY4EGRiQqLg+ZwC3Z9m8m2ZDpskYrJCSy/bM+WMPOYH+e97IYFGjF872+Ch559+eX7pbUx+AM1Tn
X-Gm-Message-State: AOJu0Yzdikaaxcalt3J4xc45f/KGWcVZLkTqUTpT1cKvjOwtAFgdECKq
	BKHuzpvw4VJZE0Rxr5UNYPNrmAznJ01JvoeVnpWhtwJum1iXiHaK/fJdQbDrNGQ=
X-Google-Smtp-Source: AGHT+IHacxbzf3/Tn4D4zr8DxU+g6lKHS4BdbcBCIA7y4IwyJKuxuCeqSqH1THd+IfXM4G7T7qC6qA==
X-Received: by 2002:a05:6a21:328c:b0:1bd:28bc:b030 with SMTP id adf61e73a8af0-1bef5fcb677mr8804996637.0.1719843635227;
        Mon, 01 Jul 2024 07:20:35 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac11e5fcasm65444985ad.114.2024.07.01.07.20.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jul 2024 07:20:34 -0700 (PDT)
Message-ID: <ef639748-3979-4236-b48d-c0c44e2d5ad2@rivosinc.com>
Date: Mon, 1 Jul 2024 16:20:15 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/8] RISC-V: Check Zicclsm to set unaligned access
 speed
To: Conor Dooley <conor@kernel.org>
Cc: Charlie Jenkins <charlie@rivosinc.com>, Jesse Taube <jesse@rivosinc.com>,
 linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Evan Green <evan@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>,
 Xiao Wang <xiao.w.wang@intel.com>, Andy Chiu <andy.chiu@sifive.com>,
 Eric Biggers <ebiggers@google.com>, Greentime Hu <greentime.hu@sifive.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 Heiko Stuebner <heiko@sntech.de>, Costa Shulyupin <costa.shul@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>,
 Anup Patel <apatel@ventanamicro.com>, Zong Li <zong.li@sifive.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 Ben Dooks <ben.dooks@codethink.co.uk>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Erick Archer <erick.archer@gmx.com>, Joel Granados <j.granados@samsung.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240625005001.37901-1-jesse@rivosinc.com>
 <20240625005001.37901-5-jesse@rivosinc.com>
 <20240626-march-abreast-83414e844250@spud> <Zn3XrLRl/yazsoZe@ghost>
 <43941f48-9905-4b25-89ef-6ad75bf1a123@rivosinc.com>
 <20240701-ajar-italicize-9e3d9b8a0264@spud>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20240701-ajar-italicize-9e3d9b8a0264@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 01/07/2024 15:58, Conor Dooley wrote:
> On Mon, Jul 01, 2024 at 09:15:09AM +0200, Clément Léger wrote:
>>
>>
>> On 27/06/2024 23:20, Charlie Jenkins wrote:
>>> On Wed, Jun 26, 2024 at 03:39:14PM +0100, Conor Dooley wrote:
>>>> On Mon, Jun 24, 2024 at 08:49:57PM -0400, Jesse Taube wrote:
>>>>> Check for Zicclsm before checking for unaligned access speed. This will
>>>>> greatly reduce the boot up time as finding the access speed is no longer
>>>>> necessary.
>>>>>
>>>>> Signed-off-by: Jesse Taube <jesse@rivosinc.com>
>>>>> ---
>>>>> V2 -> V3:
>>>>>  - New patch split from previous patch
>>>>> ---
>>>>>  arch/riscv/kernel/unaligned_access_speed.c | 26 ++++++++++++++--------
>>>>>  1 file changed, 17 insertions(+), 9 deletions(-)
>>>>>
>>>>> diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
>>>>> index a9a6bcb02acf..329fd289b5c8 100644
>>>>> --- a/arch/riscv/kernel/unaligned_access_speed.c
>>>>> +++ b/arch/riscv/kernel/unaligned_access_speed.c
>>>>> @@ -259,23 +259,31 @@ static int check_unaligned_access_speed_all_cpus(void)
>>>>>  	kfree(bufs);
>>>>>  	return 0;
>>>>>  }
>>>>> +#else /* CONFIG_RISCV_PROBE_UNALIGNED_ACCESS */
>>>>> +static int check_unaligned_access_speed_all_cpus(void)
>>>>> +{
>>>>> +	return 0;
>>>>> +}
>>>>> +#endif
>>>>>  
>>>>>  static int check_unaligned_access_all_cpus(void)
>>>>>  {
>>>>> -	bool all_cpus_emulated = check_unaligned_access_emulated_all_cpus();
>>>>> +	bool all_cpus_emulated;
>>>>> +	int cpu;
>>>>> +
>>>>> +	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICCLSM)) {
>>>>> +		for_each_online_cpu(cpu) {
>>>>> +			per_cpu(misaligned_access_speed, cpu) = RISCV_HWPROBE_MISALIGNED_FAST;
>>>>
>>>> - const: zicclsm
>>>>   description:
>>>>     The standard Zicclsm extension for misaligned support for all regular
>>>>     load and store instructions (including scalar and vector) but not AMOs
>>>>     or other specialized forms of memory access. Defined in the
>>>>     RISC-V RVA Profiles Specification. 
>>>>
>>>> Doesn't, unfortunately, say anywhere there that they're actually fast :(
>>>
>>> Oh no! That is unfortunate that the ISA does not explicitly call that
>>> out, but I think that acceptable.
>>>
>>> If a vendor puts Zicclsm in their isa string, they should expect
>>> software to take advantage of misaligned accesses. FAST is our signal to
>>> tell software that they should emit misaligned accesses.
>>
>> AFAIK, Zicclsm is not even an ISA extension, simply a profile
>> specification which means that only the execution environment which
>> provides the profile support misaligned accesses (cf
>> https://lists.riscv.org/g/tech-profiles/message/56).
> 
> I dunno, the specification status page used to describe it as an
> extension:
> https://wiki.riscv.org/display/HOME/Specification+Status+-+Historical
> My understanding was that these could be considered extensions, just
> like we are considering svade to be one.
> 
>> . I don't think we
>> can extrapolate that the misaligned accesses will be fast at all.
> 
> That is my opinion on it too. If it doesn't say "fast" and give a
> definition for what that means in the binding, then we can't assume that
> it is fast. I'm also wary of extending definitions of extensions in the
> binding, because a) I am 90% sure that people writing devicetrees don't
> care and b) it'd be a potential difference between DT and ACPI without a
> real justification (unlike the zkr or svade/svadu situations).

BTW, the profile spec [1] has a note that states the following for Zicclsm:

"Even though mandated, misaligned loads and stores might execute
extremely slowly. Standard software distributions should assume their
existence only for correctness, not for performance."

Which was also quoted in patch 1, so I guess that settles it.

Thanks,

Clément

Link:
https://github.com/riscv/riscv-profiles/blob/main/src/profiles.adoc?plain=1#L524
[1]

> 
>>> This allows for a generic kernel, like the one a distro would compile, to
>>> skip the probing when booting on a system that explicitly called out
>>> that the hardware supports misaligned accesses.
