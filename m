Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08674C77B6F
	for <linux-doc@archiver.kernel.org>; Fri, 14 Apr 2023 01:17:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229622AbjDNBRX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 13 Apr 2023 21:17:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229790AbjDNBRE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 13 Apr 2023 21:17:04 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15C8830FE
        for <linux-doc@vger.kernel.org>; Thu, 13 Apr 2023 18:17:02 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id lh8so3931779plb.1
        for <linux-doc@vger.kernel.org>; Thu, 13 Apr 2023 18:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1681435021; x=1684027021;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tFSlBIFfa4iYCx2BjtM1B+rQb8dlMLpuGpfiPxPnivc=;
        b=oOhubN5G3nXq7/4HNZpcWyoiaGVMQGb2CueCAuf+Z4WmVYDmTAZnNqAvrXg9n+fKp9
         RO4ReEAWeN4LuxhT6sFW/EK+472lKLis0KUfYHQbm5CLlFnyGbW+w6m69oOGK5Z57Lko
         GtmJnUjFh3EkNXRM0rdq60P8pT5jzFuh4vylcuK1P8W/kC14DYTPD/lg2i4BdwJ1+0Rj
         lHEU+pgdDXbPVI2qNMvGOGbPGWQWNVnneHKG11CV2vIBxcD/hVwk/T3A0S/cTGDUbVZ3
         nUT9ZjgmNpenprFfbjXMgOkcUlujgJHV4X1yw6iS1LMmLLh88xsg2SNH3M1dm35TWW6c
         2xZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681435021; x=1684027021;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tFSlBIFfa4iYCx2BjtM1B+rQb8dlMLpuGpfiPxPnivc=;
        b=EmF7R0i4j7/QPyYXyu8ZbNyLzjuwZ5J35edsXgjiujwo8yYAhpVqm9XJ/CNMXPgAd3
         njP13NFnC+zTdJnyA6ng/3IhXgc+I9sldrM/LTkWcIElZWVxEpfByp+w8xKui2dOI0LY
         uiiVVWwMI8kopqth01F1iiO+06REJ/I2N+Kjp7qUQAFmhXurfsThH2aDOyNPr2K4jMn8
         yU6uTUC7IwhmzY/UvKKkXzj1KIdeZ7Nk6zyxFk9CtzE/B9zxEu+vZV3ssuad7zD+MX4O
         kt05cL98xw+EWJqM1bQPjUEiL4+mMiEOXk8cfTYTHIlIzInaVxSg1KpuwTMaWrg9wR/h
         Sepg==
X-Gm-Message-State: AAQBX9eliWcejG0yG17YpLvQlwfeWQ1Oh6iuqVSZaaDmVRFGBYsS1BKQ
        OiA2KAKZvANtw5QvB/wcl2eYMw==
X-Google-Smtp-Source: AKy350ahdMJ8V2qg9PTbEbUXHzBvyltUI2FAlLoR02Up2BKeI13RKzQlt9/2izh+DtPygWWgOial/A==
X-Received: by 2002:a17:902:c949:b0:1a6:3d07:af32 with SMTP id i9-20020a170902c94900b001a63d07af32mr1090823pla.38.1681435021425;
        Thu, 13 Apr 2023 18:17:01 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id jd9-20020a170903260900b001a69b28f5c5sm290311plb.222.2023.04.13.18.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 18:17:00 -0700 (PDT)
Date:   Thu, 13 Apr 2023 18:17:00 -0700 (PDT)
X-Google-Original-Date: Thu, 13 Apr 2023 18:16:27 PDT (-0700)
Subject:     Re: [PATCH -fixes v2 3/3] riscv: No need to relocate the dtb as it lies in the fixmap region
In-Reply-To: <9c90f390-92d2-4dde-8cd7-b50e9c858787@spud>
CC:     alexghiti@rivosinc.com, corbet@lwn.net,
        Paul Walmsley <paul.walmsley@sifive.com>,
        aou@eecs.berkeley.edu, Conor Dooley <conor.dooley@microchip.com>,
        linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     Conor Dooley <conor@kernel.org>
Message-ID: <mhng-4113481b-4c71-4b5c-ab7e-6896058f074b@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 29 Mar 2023 08:33:45 PDT (-0700), Conor Dooley wrote:
> On Wed, Mar 29, 2023 at 04:40:18PM +0200, Alexandre Ghiti wrote:
>> On Wed, Mar 29, 2023 at 3:56 PM Conor Dooley <conor@kernel.org> wrote:
>> >
>> > On Wed, Mar 29, 2023 at 10:19:32AM +0200, Alexandre Ghiti wrote:
>> > > We used to access the dtb via its linear mapping address but now that the
>> > > dtb early mapping was moved in the fixmap region, we can keep using this
>> > > address since it is present in swapper_pg_dir, and remove the dtb
>> > > relocation.
>> > >
>> > > Note that the relocation was wrong anyway since early_memremap() is
>> > > restricted to 256K whereas the maximum fdt size is 2MB.
>> >
>> > So, should this be marked as a fix, and backported along with 1/3?
>> 
>> Hmmm the whole series should be backported, it does not make sense to
>> move the dtb mapping and keep accessing it using its linear mapping
>> address since it could fail for the exact reason the relocation was
>> implemented in the first place and the relocation is wrong.
>> 
>> Maybe we should simply add a "Cc: stable@vger.kernel.org" on all the patches?
>
> Yup, although hopefully Palmer can handle that if nothing else needs
> changing.

The bots usually pick it up anyway, but in general I try and put the 
stable CC on there when I see stuff go by.  I actually missed it this 
time until seeing the comment, though...
