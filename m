Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78F6101C6
	for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 07:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="F1G3kJxL"
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BE92D5B
	for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 00:14:49 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-32da02fca9aso603024f8f.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 00:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698045288; x=1698650088; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=26tPvjduKfKMC5Y+TnU+2kouKBcEVMva4kAveFGyFik=;
        b=F1G3kJxLX7MHUk0i87R8TZJzTWP4Yp8XZmYqCgGxwkp8HrQMyaCX6Dt1j1gxBvkXXB
         kG4znk0BfygEQPhEOzlqU2kFaBkSxvUGrO1b8PAV8Pv3VWDpqsrSACjC+lAgwFuqeYi3
         bMjrnXrTLNwUwFLZNXccASFeh6FiZH+Kw4fM3BrlRjDqIP2iJMIbPMxee17m5FpzTOwq
         qZh8in5bhZhHmZzu6XsG5ux1xj8v7+SkQoWSH0p798POrU0wFfgmVX7Augx1MP0rFlIu
         hy8D4GqpSf2AWZjVZ7Uke7w/a26iww4Xqm2FtpYDPeV0ALnGyBEZnoPPl7ESXyspz/u3
         FJKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698045288; x=1698650088;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=26tPvjduKfKMC5Y+TnU+2kouKBcEVMva4kAveFGyFik=;
        b=FyCW5NPu4iqKsGad8WzEZ1/eXVI40bW8ozgmkoLxJZgsYyIl0RTdUiuKpsLTsnebjg
         lTfNAEijsLU8wvxzvaDcOsh7tDLlOWYnaziL0wyRa4W8RSHXJk8FdM/sy0LfVbIM/pAN
         xbFmOdYbN28ca8WDgePyZvQQmo1B9rYok+V2VcdfxLEtqFjvngDQW23IWlDGifPk426M
         mS9/08GcQ9RBmy0dqExRuaTdVozpxNpYpsceuN5O7ssjaO4X8QTWXCXA5zbBuSDV6Dmm
         rttyy6LpgxkVZOj50CBC46FFlGHnRjKv3o/LNcy6t81mNGOy17PE9OV1Hg1q7R15Aqfc
         4YwA==
X-Gm-Message-State: AOJu0YyiJbN9O3wg0u3OedHOdUA/FLDjjoA/OCog+kFioJfy7N8LzTMG
	k9L33f0rIFh4XTomdE7iQAhOJg==
X-Google-Smtp-Source: AGHT+IH6cqD8gxFinz+iQF08GyX6MMtj6EnWvLXSKTAQz1NuASZ3GUeBRA+mRrbDkbRJAMkzxsQenQ==
X-Received: by 2002:adf:a356:0:b0:32d:c293:1ab4 with SMTP id d22-20020adfa356000000b0032dc2931ab4mr5018430wrb.6.1698045287746;
        Mon, 23 Oct 2023 00:14:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:17bb:4fd9:531:a7cc? ([2a01:e0a:999:a3a0:17bb:4fd9:531:a7cc])
        by smtp.gmail.com with ESMTPSA id r8-20020adff108000000b0032db1d741a6sm7144610wro.99.2023.10.23.00.14.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Oct 2023 00:14:47 -0700 (PDT)
Message-ID: <c64d9ddb-edbd-4c8f-b56f-1b90d82100b7@rivosinc.com>
Date: Mon, 23 Oct 2023 09:14:45 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/19] riscv: add ISA extension parsing for vector
 crypto extensions
To: 7626f978-e9ea-4f8f-b814-aeac02bd3712@rivosinc.com
Cc: Evan Green <evan@rivosinc.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
 Andrew Jones <ajones@ventanamicro.com>, Conor Dooley <conor@kernel.org>,
 Samuel Ortiz <sameo@rivosinc.com>
References: <20231017131456.2053396-1-cleger@rivosinc.com>
 <20231017131456.2053396-6-cleger@rivosinc.com>
 <DA8B4610-D514-4733-B875-C247FFCCC7AA@sifive.com>
 <af785f0f-9de7-4548-9cdb-f392cde1cc2b@rivosinc.com>
 <CALs-HstEBt-ntCcETa9YwS6On3nGyoEc2p7R-gaBLG9+aFJL5w@mail.gmail.com>
 <7626f978-e9ea-4f8f-b814-aeac02bd3712@rivosinc.com>
 <E30E7352-1FB0-4DB5-94C3-2C6FC2A6F484@sifive.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <E30E7352-1FB0-4DB5-94C3-2C6FC2A6F484@sifive.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 20/10/2023 04:43, Jerry Shih wrote:
> On Oct 19, 2023, at 17:35, Clément Léger <cleger@rivosinc.com> wrote:
>> On 18/10/2023 19:26, Evan Green wrote:
>>> On Wed, Oct 18, 2023 at 5:53 AM Clément Léger <cleger@rivosinc.com> wrote:
>>>>
>>>> On 18/10/2023 03:45, Jerry Shih wrote:
>>>>>
>>>>> The `Zvkb` is the subset of `Zvbb`[1]. So, the `Zvkb` should be bundled with `Zvbb`.
>>>>
>>>> Hi Jerry,
>>>>
>>>> Thanks for catching this, I think some other extensions will fall in
>>>> this category as well then (Zvknha/Zvknhb). I will verify that.
>>>
>>> The bundling mechanism works well when an extension is a pure lasso
>>> around other extensions. We'd have to tweak that code if we wanted to
>>> support cases like this, where the extension is a superset of others,
>>> but also contains loose change not present anywhere else (and
>>> therefore also needs to stand as a separate bit).
>>
>> For Zvbb and Zvknhb, I used the following code:
>>
>> static const unsigned int riscv_zvbb_bundled_exts[] = {
>> 	RISCV_ISA_EXT_ZVKB,
>> 	RISCV_ISA_EXT_ZVBB
>> };
>>
>> static const unsigned int riscv_zvknhb_bundled_exts[] = {
>> 	RISCV_ISA_EXT_ZVKNHA,
>> 	RISCV_ISA_EXT_ZVKNHB
>> };
>>
>> Which correctly results in both extension (superset + base set) being
>> enabled when only one is set. Is there something that I'm missing ?
> 
> We should not bundle zvknha and zvknhb together. They are exclusive.

Yes, but for instance, what happens if the user query the zvknha (if it
only needs SHA256) but zvknhb is present. If we don't declare zvknha,
then it will fail but the support would actually be present due to
zvknhb being there.

Clément


> Please check:
> https://github.com/riscv/riscv-crypto/issues/364#issuecomment-1726782096
> 
> -Jerry
> 
