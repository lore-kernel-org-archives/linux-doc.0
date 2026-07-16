Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F47E420894
	for <linux-doc@vger.kernel.org>; Thu, 16 Jul 2026 13:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784206866; cv=pass; b=XORBHysEgUYK60aIm2sjwLff0TxvRmdX17HnBTR3Y3M4oOFOoLy2aHRTSZjBtScKflTxPYwrI6/EkHPwhE+OSrlLp17kAq9cwDJtWWTAw9BXeHOiQANcA5WRWEUZw4RwE83SP5YDffu89O6yXFmMBSiSb/mEPp5x2pu6v15go0s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784206866; c=relaxed/simple;
	bh=VKUo370fMISPlFqMzsuyMVMvgTexx95wIxlxD2hspW0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MSXkJw10zu1Ipa7sEk5FBZRoMDCW27hYSpIPTErbw3lxrWYwd7Sn3ZbUjkb8I9FkHPTiH1VdE6HCBKXTsq50LUyblK70b3eE28xCVKoPwr2n36at64Ymjg0JLTeik+wl9NLNV7fg345tx+f888UTbq18PjNxbTUalhlDivGKm+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dqMddGu/; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dqMddGu/"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6976b0c5adbso13661450a12.2
        for <linux-doc@vger.kernel.org>; Thu, 16 Jul 2026 06:01:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784206861; cv=none;
        d=google.com; s=arc-20260327;
        b=B+S8Zr+NaGNyaFGSDqItfKr4O2jRkDVB5YaGwLArmOy+POvKeKGn6fjAKuTmX/BQZj
         seZwLBcV9vZgABRG5nuiX5l6eUlLW8tCspNmMnoBF1QIQ721r4dhGeVvlOgsjmW8wdb5
         ZUwVhxECAEvHzvMmDO2uRtzxrwFsFeJMmPuict+Ze4ZCjaMiFTjp/5yjyrVRJRYOUBKU
         tOx3PFoU3oJ3BfVyrtHeSEmy+605ifauvZTMsXDVIb601aiRIZpGSB0URVRQqMJ5uTmv
         NbgWGGLcuFP2tN0WKzNyv7AsuK2WWUjQHjdqGKr5e+VlZujf0EM0Wn3RhRqI5FQ3rTpe
         QeEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zXERITO2eXf24evX2s/DpViJVD6miQTBJvHhyq+Sh2Q=;
        fh=/so0q5u53uoxbleSKpQhlTACwv3GmLbqK82EFPw3QoU=;
        b=L0FDTqgsvSL6whWQEPViwKCKO+wowP+h9RKBAqojUgELzkFQXb7/4GXXl6J8Q/Z6mt
         +kYWD8QSJ8iQodpCOEZOIOakt+mjnA5Ux9rjs8aP2CIIx9H8GmUOJXZbIjLlDixgZ7Tt
         B7ew+Iowvmx8nX05SDOlmGUmnVFY/hi2eeHqoLqzw+mgH2OKlGLQ3Y6o1gw/z6iD7iJ0
         LE7o1n8ywRhQKhLCpe0sElOZPXOg8Pf7g/Buk9ksdVt7ly930/PEYg9U8tiybuoROmiB
         NFh3QxHUzv1TygcplD2/GJmCsBogBWcKpaZIiaVHBsyvcPA0BI5c0bRJITdKomMQ5igM
         GuUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784206861; x=1784811661; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zXERITO2eXf24evX2s/DpViJVD6miQTBJvHhyq+Sh2Q=;
        b=dqMddGu/wql9KvR/BK1o0dtNhHc90x5+vrsOlUfyz4XCywQVgCKZ19JX70Nnpk9uWN
         cYP+H9M7nDGhdfHCsdUNpiGp3793KBrlHFjofzta7dvJsE8duItRsa7SPgxH6CjyvxDM
         zUdpckDGagmB9DSBJOHjPsOCyW3QNTM69PFyt42FN86COGpcS38GCZVtMN2LqzccYHUy
         BD7GZ43kk7ZjjyErvglj/46oQzhwxJifkOyoOCPsnTYOh7dO9muSZ6PLmSNBJTIX4x/s
         5L7MBHpssn5ahiD8sTBj3O3WzSMJU4sfxJdHsHkAz/wdxZZWlNVN3buVePIdhj2C1TzR
         B+rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784206861; x=1784811661;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zXERITO2eXf24evX2s/DpViJVD6miQTBJvHhyq+Sh2Q=;
        b=lwPlxAXR0h5ySWFIc8Gf81sJ1Md6TuHps/t8kNcCewp3RKyJAjAnuSzTtp+X15tn/u
         pPFapO6NvtPgoB4L2eeVPx/mioxReB7DZ6Wg4VWtixKPVkB5pXR3iFRbsvokDfjehG4r
         No3P+yrNydedHMVjqmvD2xRv0EF0y+88g3EO1sjMhnq4r4QVY3GthZ41GwOXKVMSMp27
         Crvnh8vtk3OO80b3AlMIXv1LRhdR13Djv2tdWASQ5ZI+kg1Y1tzOsb/obKM7ndpmHCnm
         euHpQfCCrpsu+I48emMQRspHXPILiBPbRN0+iuefZy6pHGqtFC3hSE1Lhdio+rRYDnd7
         /dHw==
X-Forwarded-Encrypted: i=1; AHgh+Rq0glNm8GiEwlw0/70z8HojjSlHaO+iVzQcf3yFed9ppeLD50/rYaFu4d5gTuasqDs/PkXLR8Zyq28=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlqgsFf4zV9VnTyJF9fkXsbH5Yt3kLZ4vegIr4F12FMEuGu0WB
	I2XHgVqViYGSuGt1Su0ccTWHdgHyV+RsVd/YUS60iX3FDZ8yztOaR8TKh7WH4Otu9trGO3UGQ+E
	cH85hKzNV/UmUrJ1GWYpCMffFHuZRDjQ=
X-Gm-Gg: AfdE7ckYdIBVBxFZlVddxYKyjMh5ru7Ts/WXNHdbPgAeQixPmZZy7VV5+qzHjN3HzyZ
	2VKu27ZBBNUfiC0f8QIFEx3Tsq398e8zfAGDaQjpSfqll5o1xb93oSlPVjlekD6broX/cLvFOnQ
	ie7ZUEFcwFBC5qwPIVD176O4q18OsJCzBNVowE1yT6UElI/B3PzMfrApP9kw9GophWrjJb0uSz9
	fneLMvxlqGIn7cdZ5l0+Ovidp+68q7KTx+wvx9WXYmZ0nMauIHuyf8NpLp1Lxh1Nx6Ulf5cLA2R
	NZ8RFdR+ZFrQb1f1a/zt/v32DLuDcCM=
X-Received: by 2002:a05:6402:5193:b0:698:3469:faa3 with SMTP id
 4fb4d7f45d1cf-69cd6c711c8mr5713796a12.10.1784206860545; Thu, 16 Jul 2026
 06:01:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714020340.25014-1-akiyano@amazon.com> <20260714020340.25014-4-akiyano@amazon.com>
In-Reply-To: <20260714020340.25014-4-akiyano@amazon.com>
From: saeed bishara <saeed.bishara.os@gmail.com>
Date: Thu, 16 Jul 2026 16:00:49 +0300
X-Gm-Features: AUfX_myAoOWH5t5VUI4MOkcCF7lHw7hjBIHVeiT5yTh7jkx8162zheVbAhpxz_Y
Message-ID: <CAHfVqdWDaLEKYMw-ZfkYvKLoSJ-_HOm3X9hUUhEf7ReBbOi__w@mail.gmail.com>
Subject: Re: [PATCH v4 net-next 3/7] selftests/ptp: Add testptp support for
 attributes ioctls
To: Arthur Kiyanovski <akiyano@amazon.com>
Cc: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, 
	Richard Cochran <richardcochran@gmail.com>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, David Woodhouse <dwmw2@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Miroslav Lichvar <mlichvar@redhat.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Wen Gu <guwen@linux.alibaba.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, David Woodhouse <dwmw@amazon.com>, 
	Yonatan Sarna <ysarna@amazon.com>, Zorik Machulsky <zorik@amazon.com>, 
	Alexander Matushevsky <matua@amazon.com>, Saeed Bshara <saeedb@amazon.com>, Matt Wilson <msw@amazon.com>, 
	Anthony Liguori <aliguori@amazon.com>, Nafea Bshara <nafea@amazon.com>, 
	Evgeny Schmeilin <evgenys@amazon.com>, Netanel Belgazal <netanel@amazon.com>, Ali Saidi <alisaidi@amazon.com>, 
	Benjamin Herrenschmidt <benh@amazon.com>, Noam Dagan <ndagan@amazon.com>, David Arinzon <darinzon@amazon.com>, 
	Evgeny Ostrovsky <evostrov@amazon.com>, Ofir Tabachnik <ofirt@amazon.com>, 
	Amit Bernstein <amitbern@amazon.com>, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, shuah@kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Simon Horman <horms@kernel.org>, vadim.fedorenko@linux.dev
Content-Type: text/plain; charset="UTF-8"

>                 " -t val     shift the ptp clock time by 'val' seconds\n"
>                 " -T val     set the ptp clock time to 'val' seconds\n"
>                 " -x val     get an extended ptp clock time with the desired number of samples (up to %d)\n"
> +               " -a val     get extended timestamps with attributes (error_bound,\n"
timestamps -> ptp clock to be consistent
also, have you considered making the "-a" additional flag to -x and -A
instead of an exclusive option?


> +               printf("sample #%2d: unknown clock %d %s: %lld.%09u\n",
> +                      sample_num, clockid, when, sec, nsec);
In the case of an unknown clock, will the additional parameters
(when/sec/..) be useful?

>                 break;
>         }
>  }
> @@ -188,6 +193,7 @@ int main(int argc, char *argv[])
>         struct ptp_sys_offset *sysoff;
>         struct ptp_sys_offset_extended *soe;
>         struct ptp_sys_offset_precise *xts;
> +       struct ptp_sys_offset_attrs *attrs_data;
>
>         char *progname;
>         unsigned int i;
> @@ -208,7 +214,9 @@ int main(int argc, char *argv[])
>         int list_pins = 0;
>         int pct_offset = 0;
>         int getextended = 0;
> +       int getextendedattrs = 0;
>         int getcross = 0;
> +       int getcrossattrs = 0;
>         int n_samples = 0;
>         int pin_index = -1, pin_func;
>         int pps = -1;
> @@ -226,7 +234,8 @@ int main(int argc, char *argv[])
>
>         progname = strrchr(argv[0], '/');
>         progname = progname ? 1+progname : argv[0];
> -       while (EOF != (c = getopt(argc, argv, "cd:e:E:f:F:ghH:i:k:lL:n:o:p:P:rsSt:T:w:x:Xy:z"))) {
> +       while (EOF != (c = getopt(argc, argv,
> +                                 "a:Acd:e:E:f:F:ghH:i:k:lL:n:o:p:P:rsSt:T:w:x:Xy:z"))) {
>                 switch (c) {
>                 case 'c':
>                         capabilities = 1;
> @@ -311,9 +320,22 @@ int main(int argc, char *argv[])
>                                 return -1;
>                         }
>                         break;
> +               case 'a':
> +                       getextendedattrs = atoi(optarg);
> +                       if (getextendedattrs < 1 ||
> +                           getextendedattrs > PTP_MAX_SAMPLES) {
> +                               fprintf(stderr,
> +                                       "number of extended attrs timestamp samples must be between 1 and %d; was asked for %d\n",
> +                                       PTP_MAX_SAMPLES, getextendedattrs);
> +                               return -1;
> +                       }
> +                       break;
>                 case 'X':
>                         getcross = 1;
>                         break;
> +               case 'A':
> +                       getcrossattrs = 1;
> +                       break;
>                 case 'y':
>                         if (!strcasecmp(optarg, "realtime"))
>                                 ext_clockid = CLOCK_REALTIME;
> @@ -367,6 +389,8 @@ int main(int argc, char *argv[])
>                                "  %d programmable pins\n"
>                                "  %d cross timestamping\n"
>                                "  %d adjust_phase\n"
> +                              "  %d extended_attrs\n"
> +                              "  %d precise_attrs\n"
>                                "  %d maximum phase adjustment (ns)\n",
>                                caps.max_adj,
>                                caps.n_alarm,
> @@ -376,6 +400,8 @@ int main(int argc, char *argv[])
>                                caps.n_pins,
>                                caps.cross_timestamping,
>                                caps.adjust_phase,
> +                              caps.extended_attrs,
> +                              caps.precise_attrs,
>                                caps.max_phase_adj);
>                 }
>         }
> @@ -648,6 +674,49 @@ int main(int argc, char *argv[])
>                 free(soe);
>         }
>
> +       if (getextendedattrs) {
> +               attrs_data = calloc(1, sizeof(*attrs_data) +
> +                                   getextendedattrs * sizeof(struct ptp_timestamp));
> +               if (!attrs_data) {
> +                       perror("calloc");
> +                       return -1;
> +               }
> +
> +               attrs_data->request.num_samples = getextendedattrs;
> +               attrs_data->request.clock_id = ext_clockid;
> +
> +               if (ioctl(fd, PTP_SYS_OFFSET_EXTENDED_ATTRS, attrs_data)) {
> +                       perror("PTP_SYS_OFFSET_EXTENDED_ATTRS");
> +               } else {
> +                       printf("extended attrs timestamp request returned %d samples\n",
> +                              getextendedattrs);
> +
> +                       for (i = 0; i < getextendedattrs; i++) {
> +                               struct ptp_timestamp *ts = &attrs_data->timestamps[i];
> +
> +                               printf("  sample #%u:\n", i);
> +                               printf("    sys before: %lld ns\n",
> +                                      (long long)ts->pre_systime.sys_time);
> +                               printf("    phc time:   %lld.%09u\n",
> +                                      ts->devtime.device_time.sec,
> +                                      ts->devtime.device_time.nsec);
> +                               if (ts->devtime.attrs.valid & PTP_ATTRS_VALID_ERROR_BOUND)
> +                                       printf("    error_bound: %u ns\n",
> +                                              ts->devtime.attrs.error_bound);
in case device doesn't report error bound, I think it's better to
print explicit message
