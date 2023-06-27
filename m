Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70642EB64DC
	for <linux-doc@archiver.kernel.org>; Tue, 27 Jun 2023 23:39:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229927AbjF0XjJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 27 Jun 2023 19:39:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229948AbjF0XjI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 27 Jun 2023 19:39:08 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 239571FEB
        for <linux-doc@vger.kernel.org>; Tue, 27 Jun 2023 16:39:06 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-544c0d768b9so4084228a12.0
        for <linux-doc@vger.kernel.org>; Tue, 27 Jun 2023 16:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687909145; x=1690501145;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UEotHXGDYPp+N3kzq40A+VGZCyOFKrHwBcgbYar1LOg=;
        b=eYlkZ7RRnjfcOrSEl/RtfXtVIUDXY/SobZ+VOu+z+XZHDsoEHatYx90/aUQor4mUER
         wxITd49Kw7XvhgcVFYoq4mFZHL7z9aHi0r+QhYL+g6lSIMWRwtUnRedNFC3xOasfMCGu
         NMW3alJ7N94ag1BxPWU3TUclX+f/qX/0DGmvK8TotY9FNIbXV2sghgXhF1dj95yOf38/
         aHhPazCeoEJ3bjLeb0sOynGrNXxx3SbNj3Yv4MZJkno3PbCEZ90u3WQM2pmyz5GbAghI
         VTNT8URWzEYzrjzYGj1gAMAkiBLPMrE0uL/vLOppa8GJnYQW2b0d5av0daalTnL+EJTh
         10/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687909145; x=1690501145;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UEotHXGDYPp+N3kzq40A+VGZCyOFKrHwBcgbYar1LOg=;
        b=YA0utJuqbQ8HDkyT1YPioLBpcFUlkbIxtbUzOWap6w6ppdCP+bTutaJmqAST+xwBYY
         2J8B9NvnhHyh7NtEdyVL2Iutq1HMPv03kSXzvWJuvUECixNLxfTsVzoEfrvpkpu5ehM+
         i//1G9+SwybTkwVe+eRUczF8whqZbsE8Idrqdyr/MAV81y2H5sFiXkiFcpGNVK2dsJsz
         +jv98neHJCL8Z6xfY+aBT4IJtoFHMz45YJssDoZ+yofUswXvEQ5wi5T/SsLgHnfoKfBx
         z7M/VZ1tBZSxEY99VnxfB8nfPppu9Hgi8UNnqhtsHxMq5H5VN4TiGe1DzrHQbzLN3wRU
         gLrg==
X-Gm-Message-State: AC+VfDyTT6KmcovZwhojBvxvl9Tb0P9IByUo5KxiS1pAp38viOMTc5uz
        mBJLDGBbANLZWIO8dPwGFUXq8w==
X-Google-Smtp-Source: ACHHUZ5OkeSCUeB3U9dhKZWjZbN1Lvc3xdWPDUeDJ0nMM+W1gpyxhwafH7+mT55TVE586Y44vKy4GQ==
X-Received: by 2002:a05:6a20:244b:b0:12b:6898:2986 with SMTP id t11-20020a056a20244b00b0012b68982986mr3198761pzc.1.1687909145650;
        Tue, 27 Jun 2023 16:39:05 -0700 (PDT)
Received: from ghost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id fe8-20020a056a002f0800b00666912d8a52sm4748899pfb.197.2023.06.27.16.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 16:39:05 -0700 (PDT)
Date:   Tue, 27 Jun 2023 16:38:58 -0700
From:   Charlie Jenkins <charlie@rivosinc.com>
To:     Jessica Clarke <jrtc27@jrtc27.com>
Cc:     Alexandre Ghiti <alexghiti@rivosinc.com>,
        Atish Patra <atishp@rivosinc.com>,
        Conor Dooley <conor@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@rivosinc.com>,
        Albert Ou <aou@eecs.berkeley.edu>, bjorn@rivosinc.com,
        Anup Patel <anup@brainfault.org>,
        Evan Green <evan@rivosinc.com>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        konstantin@linuxfoundation.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 1/2] RISC-V: mm: Restrict address space for sv39,sv48,sv57
Message-ID: <ZJtzEn9Yut3nPuw8@ghost>
References: <20230627222152.177716-1-charlie@rivosinc.com>
 <20230627222152.177716-2-charlie@rivosinc.com>
 <473F7474-D7AA-4C9F-95A3-320F1741EC50@jrtc27.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <473F7474-D7AA-4C9F-95A3-320F1741EC50@jrtc27.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yes it is small to have a default of 38-bits of userspace. I would be
interesting in the opinions of other people on whether it would be
acceptable to have the default be sv48 and require applications that
prefer fewer bits to specify so with the given mmap hinting.
