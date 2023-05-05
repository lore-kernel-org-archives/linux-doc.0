Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78051C77B7D
	for <linux-doc@archiver.kernel.org>; Fri,  5 May 2023 05:40:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229703AbjEEFkt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 5 May 2023 01:40:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbjEEFks (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 5 May 2023 01:40:48 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A01EA11B76
        for <linux-doc@vger.kernel.org>; Thu,  4 May 2023 22:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683265200;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=B7kVUYKilEKC1sSmEWakcXvmq4DsPQRiV4ukNCTywSc=;
        b=VrbisXMQCwx0ZA+wHLuNX8iy+Duf2xGuSIVimmGZTlK/WQgND0DYhfNuxaX0zjfvUHIi3F
        N0W2v0+RKCapt8tk9jZuCjgLx6ErFVJOpvUUDmO4f2CaX4UMBbKAxwW4l29RfQ2akBK+Yg
        4U9RtnNaTO5caFqzK01j4f0nwqq4bGs=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-fUaKaBTGN82JY0TMrGZWwA-1; Fri, 05 May 2023 01:39:58 -0400
X-MC-Unique: fUaKaBTGN82JY0TMrGZWwA-1
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-545e23a24b6so1039955eaf.1
        for <linux-doc@vger.kernel.org>; Thu, 04 May 2023 22:39:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683265197; x=1685857197;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B7kVUYKilEKC1sSmEWakcXvmq4DsPQRiV4ukNCTywSc=;
        b=LWnP+qEOLE1JDzBoHeAQB8mJ118WDKkZ7hmuCvqJcvLa8rrMBa2S3JYFj2zdJzZIx0
         z9VZYekqo8++adKEh+Q8vS31lIWbXe4mvlrfK4tg17TGOe8Pb2hivaDF6uqtRKWwj5h0
         cMYpjFV6hYVWjjBk6UZlF/1NSL9F6WHY8kpYCBQ0xMj5wpSUPoHRY36b3DZgQC9/GRLz
         /ZRYMVRUMjuMY8RMQbCDnCufOVSrb8RRsydpcd3/zOan13kOEEhpc1mmXAunGPuMP0Iz
         x8Z6Q+EaAECXB0rOV35pvVsJpL+l1mmuS/6FN5N2O6pH6zlYS2DQjJCDJwHhX2ANEsRO
         5zrw==
X-Gm-Message-State: AC+VfDy8EorGYvX8opocwU8y31vxycxu9UjoxKQdpoIqrmN8UEcZ1NKd
        vkoc42zew1FOopyaVjO8/djc330qIORVKW2HS1I4kZwO4OHmyMFButoAAQXgOlXmMBQ9AAf+QFa
        hfJEgTzRyIYDGAhGnBSpQVSwpuZl8RdrQXb5wndL8/Ugg0CI=
X-Received: by 2002:a05:6808:150:b0:38d:ce1e:306e with SMTP id h16-20020a056808015000b0038dce1e306emr34753oie.34.1683265197609;
        Thu, 04 May 2023 22:39:57 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4evgGa3yxWmOKvDQyUe48IQ3fGoJnCZIUnXAFsqCW728s0O5cb4DUrp8vPlNnfa6aHS5mgHxkgCo3kPf4R30A=
X-Received: by 2002:a05:6808:150:b0:38d:ce1e:306e with SMTP id
 h16-20020a056808015000b0038dce1e306emr34749oie.34.1683265197395; Thu, 04 May
 2023 22:39:57 -0700 (PDT)
MIME-Version: 1.0
From:   Costa Shulyupin <costa.shul@redhat.com>
Date:   Fri, 5 May 2023 08:39:46 +0300
Message-ID: <CADDUTFy29Cn6y56XLB-me0FneXrMED0LuHLb-7KD_NoiXZSZrg@mail.gmail.com>
Subject: confusing documentation about Development Process
To:     linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Cc:     open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

There are five topics named "Development Process" or "Working with the
development community" or both.

It is clear that these topics are related to the development. Some
content is overlapping.

Questions:
- Is it by design or chance?
- What are the principal differences between the topics?
- Are there any outdated documents?
- How should it be?


References:

"Working with the development community":
https://docs.kernel.org/index.html#working-with-the-development-community

- "All development-process docs" linked to "Working with the kernel
development" community: https://docs.kernel.org/process/index.html

-  - "How the development process works":
https://docs.kernel.org/process/2.Process.html

- "A guide to the Kernel Development Process":
https://docs.kernel.org/process/development-process.html

Development tools and processes:
https://docs.kernel.org/index.html#development-tools-and-processes

Thanks,
Costa

