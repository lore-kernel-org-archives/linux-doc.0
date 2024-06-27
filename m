Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2C945BE6
	for <linux-doc@vger.kernel.org>; Thu, 27 Jun 2024 08:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719475919; cv=none; b=FlZScL8MfCgmaBLEAm8x9hrkO44eF6yDbsvasNaUx+R3uNeCQt4FaeuNiwyLlkGkgE4oXDuwfQxvMe35uwIcltVaPTdcTypg++Gp/98H1AYCZtpLXgfrluutZZFhKbbUM98FXcDD1TvWYOyccVYoyG7TSvLX3onPYueKmnycFzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719475919; c=relaxed/simple;
	bh=H4sf75wa+u9MafsJdYli4CEuqRcSVkKoC4HHQCaaP+Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=vBc4NZEuq80MNDZPLUpqaoHxAhcKlMe9cGrS3lzB9OyxdiLreQ3lfSgkqb1DV2AJEz8aCSiorPmEgTR6AbGZLdnm8cjkl6EpD5on/1gDQts4Vn17L+Ev//0CHGLM4J9o/x8WNjmVRpwVCwreUw6LXCy30Ss0fCxfuhi2FenYrqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=N0YArAc/; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="N0YArAc/"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52d259dbe3cso2476888e87.0
        for <linux-doc@vger.kernel.org>; Thu, 27 Jun 2024 01:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1719475915; x=1720080715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:user-agent:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=msK5wFfGDF/WutTur9LQCLii2ycv1OFon1M4QxMP/sI=;
        b=N0YArAc/R5ECuFuXx25EGjh2KVi4gr72sb7GdaE1dIYLcBPJfj54fyH5oXL038M/4W
         +GcIeniwNH7DJXEG0ihVWAkWXTdr4pqHsyxMv50TOW+N7/qqAAXyNt0zspE3/thkSt+n
         79XyxRXuqJy6Pz4t/Lw2U6cMKj+A2+Lf+BMF7RpcbmEKi3gj28hcEBTI0uAWsl1RSXy2
         Jw/hgiQS0FpL9e+553SUVEw9OrIk5DeL6XWr1EJRhCUYft0c7nT5dMXFLprfEhrTsRF4
         LbE/9mxNYIUPmjlIn0qhXMp9EJiMyTjmsWpqnGbO70iQyPpaifSATRehskM4MpiOr8Ei
         T8GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719475915; x=1720080715;
        h=content-transfer-encoding:mime-version:user-agent:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=msK5wFfGDF/WutTur9LQCLii2ycv1OFon1M4QxMP/sI=;
        b=C9Av5bUCRDpZOeHylgLzJfo7Ed+CDZZoo/miePOVjOlP6H1min+5ObgdLJzLGH67LF
         SvrJODSZcwblV+oAJxAv9JxD0ifAAOax9CMexxQb71HyfvLDQ8KdehlCdwqhCDWgxjsx
         vva+iSpIss3jlNvUXEpeRWhIjXavz9DRP89J10QAMebfPYJjDRQr/0BNt7nFrSlo9G/c
         IK/a7BH20BR5wBBx0akHDxrjjnfvNpbz0qaZRIOh+GAziO4VFUGGcb9AfSbFfywM9VM+
         Rzxlhb0bB/Jx+pqBuLFaj/m1BI+gn99CAhJYyeEBXqrdlSC0OGDFVNXkOz1ynXp9ExV7
         YdJA==
X-Forwarded-Encrypted: i=1; AJvYcCWdlrJzkMbAufPWt2LrblX4EHc/85FggtbFrp4ZgYqlCaI+0HO8g8JP0dxJWWo9iUGtnifI/Eqx4vjUhCNx12J9LsTJZtrwM7Ff
X-Gm-Message-State: AOJu0Yz1nfwPxKEM1OhraH5DUBvW5z5afIrYDRe6U5iQOpVCVyoqR5AC
	OfmeenUHTKJLovIOgtJIG6ekfuIruxLQWbIwUYI9h1IfUpAXVrXN8nzqdaKveEU=
X-Google-Smtp-Source: AGHT+IEDopEuSNAPoRqMq46CO/kVJCKi+X7E3kF8387qXA6YgPT43ltjyIFnDOjv4772zX4xLAWpIA==
X-Received: by 2002:a05:6512:348c:b0:52c:86d7:fa62 with SMTP id 2adb3069b0e04-52ce061b1femr9639838e87.23.1719475914653;
        Thu, 27 Jun 2024 01:11:54 -0700 (PDT)
Received: from localhost ([149.71.16.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-425649d7055sm14715715e9.0.2024.06.27.01.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 01:11:54 -0700 (PDT)
From: Punit Agrawal <punit.agrawal@bytedance.com>
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: jesse@rivosinc.com,  jrtc27@jrtc27.com,  corbet@lwn.net,
  paul.walmsley@sifive.com,  palmer@dabbelt.com,  aou@eecs.berkeley.edu,
  cleger@rivosinc.com,  evan@rivosinc.com,  conor.dooley@microchip.com,
  costa.shul@redhat.com,  andy.chiu@sifive.com,  samitolvanen@google.com,
  linux-doc@vger.kernel.org,  linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org,  punit.agrawal@bytedance.com,  Sunil V L
 <sunilvl@ventanamicro.com>,  Palmer Dabbelt <palmer@rivosinc.com>,  Anup
 Patel <anup@brainfault.org>
Subject: Re: [PATCH v3] RISC-V: Provide the frequency of time CSR via hwprobe
In-Reply-To: <CAEEQ3wmV56GUNmOMV3ydkKjRu3Jt4Vw9Nb5r-0KYiF9d5tF6fw@mail.gmail.com>
	(yunhui cui's message of "Tue, 25 Jun 2024 10:08:59 +0800")
References: <20240622025514.66537-1-cuiyunhui@bytedance.com>
	<CAEEQ3wmV56GUNmOMV3ydkKjRu3Jt4Vw9Nb5r-0KYiF9d5tF6fw@mail.gmail.com>
Date: Thu, 27 Jun 2024 09:11:53 +0100
Message-ID: <8734oyoldi.fsf@bytedance.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

yunhui cui <cuiyunhui@bytedance.com> writes:

> Add punit and sunil in the loop.

Thanks for looping us in.

> On Sat, Jun 22, 2024 at 10:55=E2=80=AFAM Yunhui Cui <cuiyunhui@bytedance.=
com> wrote:
>>
>> From: Palmer Dabbelt <palmer@rivosinc.com>
>>
>> A handful of user-visible behavior is based on the frequency of the
>> time CSR.

It will be helpful to add more context to the commit log - especially
for something that is being exposed in a user visible
interface. Something like below -

    The RISC-V architecture makes a real time counter CSR (via RDTIME
    instruction) available for applications in U-mode but there is no
    architected mechanism for an application to discover the frequency
    the counter is running at. Some applications (e.g., DPDK) use the
    time counter for basic performance analysis as well as fine grained
    time-keeping.

    Add support to the hwprobe system call to export the timer counter
    frequency to code running in U-mode.

With the commit log updated,

Acked-by: Punit Agrawal <punit.agrawal@bytedance.com>

Thanks

>>
>> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
>> Reviewed-by: Evan Green <evan@rivosinc.com>
>> Reviewed-by: Anup Patel <anup@brainfault.org>
>> ---
>>  Documentation/arch/riscv/hwprobe.rst  | 2 ++
>>  arch/riscv/include/asm/hwprobe.h      | 2 +-
>>  arch/riscv/include/uapi/asm/hwprobe.h | 1 +
>>  arch/riscv/kernel/sys_hwprobe.c       | 5 +++++
>>  4 files changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/r=
iscv/hwprobe.rst
>> index df5045103e73..ec3c99474ed7 100644
>> --- a/Documentation/arch/riscv/hwprobe.rst
>> +++ b/Documentation/arch/riscv/hwprobe.rst
>> @@ -233,3 +233,5 @@ The following keys are defined:
>>
>>  * :c:macro:`RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE`: An unsigned int which
>>    represents the size of the Zicboz block in bytes.
>> +
>> +* :c:macro:`RISCV_HWPROBE_KEY_TIME_CSR_FREQ`: Frequency (in Hz) of `tim=
e CSR`.
>> diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/h=
wprobe.h
>> index 150a9877b0af..ef01c182af2b 100644
>> --- a/arch/riscv/include/asm/hwprobe.h
>> +++ b/arch/riscv/include/asm/hwprobe.h
>> @@ -8,7 +8,7 @@
>>
>>  #include <uapi/asm/hwprobe.h>
>>
>> -#define RISCV_HWPROBE_MAX_KEY 7
>> +#define RISCV_HWPROBE_MAX_KEY 8
>>
>>  static inline bool riscv_hwprobe_key_is_valid(__s64 key)
>>  {
>> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/=
uapi/asm/hwprobe.h
>> index 2fb8a8185e7a..5053a9b18710 100644
>> --- a/arch/riscv/include/uapi/asm/hwprobe.h
>> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
>> @@ -74,6 +74,7 @@ struct riscv_hwprobe {
>>  #define                RISCV_HWPROBE_MISALIGNED_MASK           (7 << 0)
>>  #define RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE    6
>>  #define RISCV_HWPROBE_KEY_MISALIGNED_PERF      7
>> +#define RISCV_HWPROBE_KEY_TIME_CSR_FREQ        8
>>  /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
>>
>>  /* Flags */
>> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwp=
robe.c
>> index e4ec9166339f..3d47edc04a3f 100644
>> --- a/arch/riscv/kernel/sys_hwprobe.c
>> +++ b/arch/riscv/kernel/sys_hwprobe.c
>> @@ -8,6 +8,7 @@
>>  #include <asm/cacheflush.h>
>>  #include <asm/cpufeature.h>
>>  #include <asm/hwprobe.h>
>> +#include <asm/delay.h>
>>  #include <asm/sbi.h>
>>  #include <asm/switch_to.h>
>>  #include <asm/uaccess.h>
>> @@ -227,6 +228,10 @@ static void hwprobe_one_pair(struct riscv_hwprobe *=
pair,
>>                         pair->value =3D riscv_cboz_block_size;
>>                 break;
>>
>> +       case RISCV_HWPROBE_KEY_TIME_CSR_FREQ:
>> +               pair->value =3D riscv_timebase;
>> +               break;
>> +
>>         /*
>>          * For forward compatibility, unknown keys don't fail the whole
>>          * call, but get their element key set to -1 and value set to 0
>> --
>> 2.20.1
>>
