Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 937D22D97B4
	for <linux-doc@vger.kernel.org>; Fri, 19 Dec 2025 10:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766140766; cv=none; b=oD5nchyvSZoyAG9sg1A3HV+LMXaZjEvdC3b++WMFV2zMpDhQ5rxbau5TcjAs7Aw+PU02CELNQCA7XwYp/w4Xt2XIZmyE3WqAqTBBMvb0WEWvnf+sKuuPp1NrtUbfU9VEH4XvIwGJQJw0aiR8UCgxnQmorSAaXz3JruN2OA5OJ5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766140766; c=relaxed/simple;
	bh=mGsn0FM6mPE/Zvdf2Mf1taBhL3tfR6lmIzngSQM89TM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y2SPq8pnWNkhl99Kr9O31Zvk4AG5vQP3Cd4hptbB2zifMx+KaUP/cZ8PZ+3kekLiHhxc9qsF6pO/c4rHTuC+nWRvVIm8usBkFTpKsNGycDX+x1+WBUEvUi06DDQcCAcToigQlfvbNZxStARDUOmI2/UQ4WNrGuKHo8IeEIaaU3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 47CEAFEC;
	Fri, 19 Dec 2025 02:39:16 -0800 (PST)
Received: from e134710.manchester.arm.com (e134710.arm.com [10.33.10.82])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9AF7B3F5CA;
	Fri, 19 Dec 2025 02:39:21 -0800 (PST)
From: Ahmed Tiba <ahmed.tiba@arm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: tony.luck@intel.com,
	bp@alien8.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	rafael@kernel.org,
	linux-doc@vger.kernel.org,
	Dmitry.Lamerov@arm.com,
	Michael.Zhao2@arm.com,
	Ahmed.Tiba@arm.com
Subject: Re: [PATCH 10/12] dt-bindings: ras: document estatus provider
Date: Fri, 19 Dec 2025 10:37:57 +0000
Message-ID: <20251219103850.2722580-1-ahmed.tiba@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <57772b40-e4d9-4152-9709-04ba897608d0@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 19/12/2025 10:53, Krzysztof Kozlowski wrote:
>> On 17/12/2025 12:41, Krzysztof Kozlowski wrote:
>>>> +properties:
>>>> +  compatible:
>>>> +    const: arm,ras-ffh
>>>
>>> Again ras - what's that? Your patch or binding must explain that.
>>
>> That updated description will explicitly expand the Arm RAS acronym so the
>> compatible string is self-explanatory.
>>
>>>> +
>>>> +  reg:
>>>> +    minItems: 1
>>>
>>> Why is this flexible?
>>
>> I'll keep `reg` describing the CPER status buffer, cap it at two entries, and
>> document the second entry as the optional doorbell register that some firmware
>> requires before reusing the buffer.
>
> I still do not understand why this is flexible or in other words - why
> second address space appears and disappears.

The second address space is only present for firmware that exposes an ACK register.
Not all platforms require this extra handshake so that address shows up only
when the extra handshake exists. I’ll say that clearly in the binding
so it’s obvious the region is optional.

>>
>>>> +    items:
>>>> +      - description: CPER status block exposed by firmware
>>>> +      - description:
>>>> +          Optional 32- or 64-bit acknowledgment register. Firmware watches this
>>>> +          register and expects bit 0 to be written to 1 once the OS consumes the
>>>> +          status buffer so it can reuse the record.
>>>> +


Best regards,
Ahmed
