Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 454107DE78
	for <lwn-linux-doc@archive.lwn.net>; Wed,  2 May 2018 15:29:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751171AbeEBP3K (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 2 May 2018 11:29:10 -0400
Received: from mail-io0-f195.google.com ([209.85.223.195]:37158 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751535AbeEBP3G (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 May 2018 11:29:06 -0400
Received: by mail-io0-f195.google.com with SMTP id e20-v6so17954276iof.4
        for <linux-doc@vger.kernel.org>; Wed, 02 May 2018 08:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=6iuSgSHO95gOCYNelmTwLpKGLZlSQcNMjayssl8k4L8=;
        b=gPm4JyZqbe7SjGO++A9/A+90OSuu99dfStUoYgs/Cp8QRydXKfIaxUS3WUuVovE8oW
         3DEQ9NQe1FuWC6Jt0e9ZsELgA7IcAD/PP5KpQJsj4kcPL47VId6iRLNGTczEHYVdxWoO
         K/IhYs0nMgWSlbsCQf7q/mkru4DKAepqI9zsM6zmnrWmWF6IX8E0IK46Squasqgh74Dp
         05GQ5ilfnHE7C5ybpE0m0nCtf/eSpfiso2M/ltLygcgy/fJQyZyPFUj4iCAEUNA5pPgm
         AplMv3oPGv/yBbvLMKc4WdYHIplTZeA/dHBYpF47eqxaXCF7Uy7yckeXoGmz0baeUy8Y
         VeWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=6iuSgSHO95gOCYNelmTwLpKGLZlSQcNMjayssl8k4L8=;
        b=Sn+ClM6z/gwRMVwku9CVIn3Iqzdp7qu18Xh5obAUOhV7+j6hGAb+hZk6VFt2ic2BJa
         EN4CT9m3ItHf62ILEti/WZ8FkmLeeAiash9mepd1JFoGPlABGFe2D7BNJOP9P1yvTea/
         hBMqjWqYjA6alzsKDtgM2z0PJr8/5EDNbkV2hcA0NpeOFGRDI/NSA0CVfN0jCYgDsVft
         pM1ddSwB5ssBhwHyprNaWDkKYN7i1aOmPKeIP10hpGKGqUzBGlytQD14u4aTMlXH+OBy
         KiAE9zheRnVVvq+sWvDrQtV6U2E1cZbWlrr9jDnFPxSqFxkD257Z7g9xJnzc5Hj89lTH
         DcaA==
X-Gm-Message-State: ALQs6tDyAWnN7+1zXE/ADyXDLDdQzdp1Bfsh34fzcRxFHEFc7v17wi95
        r62D+VOjN+pEwITR2wSGSsJpOchyeSRjZ7iPiF63Sw==
X-Google-Smtp-Source: AB8JxZowJLy6Gal4yX/ow8ogykWJv3gSkzUpfWQZ6g69dVQNdlnL6YtMx4U8fHbOez9qp/aPKBA47YbLKhTLlZLFuno=
X-Received: by 2002:a6b:84a6:: with SMTP id o38-v6mr21010929ioi.119.1525274945031;
 Wed, 02 May 2018 08:29:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a02:6658:0:0:0:0:0 with HTTP; Wed, 2 May 2018 08:29:04 -0700 (PDT)
In-Reply-To: <20180426154725.74a33tnevvbtqx63@armageddon.cambridge.arm.com>
References: <cover.1524077494.git.andreyknvl@google.com> <949c343a4b02b41b80f324c2b7cd56b75e6a04f3.1524077494.git.andreyknvl@google.com>
 <20180426154725.74a33tnevvbtqx63@armageddon.cambridge.arm.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Wed, 2 May 2018 17:29:04 +0200
Message-ID: <CAAeHK+xWV2RNuoOrgkLrQ973eV2r8xFOcrzHWVrQZz7XA2WGYA@mail.gmail.com>
Subject: Re: [PATCH 3/6] arm64: untag user addresses in copy_from_user and others
To:     Catalin Marinas <catalin.marinas@arm.com>
Cc:     Will Deacon <will.deacon@arm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        James Morse <james.morse@arm.com>,
        Kees Cook <keescook@chromium.org>,
        Bart Van Assche <bart.vanassche@wdc.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Ingo Molnar <mingo@kernel.org>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Dan Williams <dan.j.williams@intel.com>,
        "Aneesh Kumar K . V" <aneesh.kumar@linux.vnet.ibm.com>,
        Zi Yan <zi.yan@cs.rutgers.edu>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Kostya Serebryany <kcc@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Evgeniy Stepanov <eugenis@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Apr 26, 2018 at 5:47 PM, Catalin Marinas
<catalin.marinas@arm.com> wrote:
> On Wed, Apr 18, 2018 at 08:53:12PM +0200, Andrey Konovalov wrote:
>> @@ -238,12 +239,15 @@ static inline void uaccess_enable_not_uao(void)
>>  /*
>>   * Sanitise a uaccess pointer such that it becomes NULL if above the
>>   * current addr_limit.
>> + * Also untag user pointers that have the top byte tag set.
>>   */
>>  #define uaccess_mask_ptr(ptr) (__typeof__(ptr))__uaccess_mask_ptr(ptr)
>>  static inline void __user *__uaccess_mask_ptr(const void __user *ptr)
>>  {
>>       void __user *safe_ptr;
>>
>> +     ptr = untagged_addr(ptr);
>> +
>>       asm volatile(
>>       "       bics    xzr, %1, %2\n"
>>       "       csel    %0, %1, xzr, eq\n"
>
> First of all, passing a tagged user pointer throughout the kernel is
> safe with uaccess routines but not suitable for find_vma() etc.
>
> With this change, we may have an inconsistent behaviour on the tag
> masking, depending on whether the entry code uses __uaccess_mask_ptr()
> or not. We could preserve the tag with something like:
>
> diff --git a/arch/arm64/include/asm/uaccess.h b/arch/arm64/include/asm/uaccess.h
> index e66b0fca99c2..ed15bfcbd797 100644
> --- a/arch/arm64/include/asm/uaccess.h
> +++ b/arch/arm64/include/asm/uaccess.h
> @@ -244,10 +244,11 @@ static inline void __user *__uaccess_mask_ptr(const void __user *ptr)
>         void __user *safe_ptr;
>
>         asm volatile(
> -       "       bics    xzr, %1, %2\n"
> +       "       bics    xzr, %3, %2\n"
>         "       csel    %0, %1, xzr, eq\n"
>         : "=&r" (safe_ptr)
> -       : "r" (ptr), "r" (current_thread_info()->addr_limit)
> +       : "r" (ptr), "r" (current_thread_info()->addr_limit),
> +         "r" (untagged_addr(ptr))
>         : "cc");
>
>         csdb();

Just to make sure I understood this assembly snippet correctly, this
change will result in checking untagged address against addr_limit,
and returning the original tagged address if the check passes. Sure,
sounds good, I'll do that.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
