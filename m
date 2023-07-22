Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C617EB64DC
	for <linux-doc@archiver.kernel.org>; Sat, 22 Jul 2023 08:05:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230037AbjGVIFc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 22 Jul 2023 04:05:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbjGVIFa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 22 Jul 2023 04:05:30 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 203A92D45
        for <linux-doc@vger.kernel.org>; Sat, 22 Jul 2023 01:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690013083;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=jbSZkv9qcwLx6TkEBQeR4Wnol8rh9QTnB0QIfSJxe8A=;
        b=I/TVtsFCJ2V9d0sADVBXuVTqNHPjMAecG2iL7WcQXn+tkJPDfuUc1/IRd+TyxOkf56a2k5
        zHAVJRnCF+wINbVJoqVRxEc3GqrXbm94oiT+A022G6L1jVLUV9RXm79lk3kxZg5gaUTpHv
        zAlcAqxYF5tod/fuRJrGJj8myuyVkcg=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-8dnmpb-SMpys7NA5xnu-4A-1; Sat, 22 Jul 2023 04:04:41 -0400
X-MC-Unique: 8dnmpb-SMpys7NA5xnu-4A-1
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-1b02ecda1a3so4791364fac.1
        for <linux-doc@vger.kernel.org>; Sat, 22 Jul 2023 01:04:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690013081; x=1690617881;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jbSZkv9qcwLx6TkEBQeR4Wnol8rh9QTnB0QIfSJxe8A=;
        b=LUQNMki92fWMz/1jEDL0VVYisV/iDjR2uLgbWTUtu+SnVFVBx7Id2+hUnefxx4JfGx
         SwsM3T11/xLiXI9T5rYR91tKpEw5rpvsxkXEUFYQElRkeMkCE226KTbC0IfPRCnu9WSU
         09MzMxzdU14xxdU457VVMeb/tnfH2p9I8lEuFkwGRkhF3louH9S6dPD9GvcojdoUhlaN
         YlBwbjrpll0C/frpuz/CdNYmRoG0euQ76Rz7Xw0VqWI03dkzhQ6STbcJDfAIDAXVH9wI
         RjdGrIr/qILSv+vqYW88S4Ym5/NIjSD92hWe3/OV8ZNs7p00PssxETehtsNC0vRXwk+d
         +aaA==
X-Gm-Message-State: ABy/qLZPXbRCMc54Br7ZFFvU86sOG/uvRWxPrZ0BdFfpsf8T74fT+LIG
        EVZA7VVI8tX+B09hrxA/0X0sZohlS1MHXZEE9Ov2b+LsTZOaORxweFZaBJIHvakuvg04xnrmR3i
        J354LooRKlC4KwgzWo7Zu3cRYsFW5ddk5dalwjFqj7CX3fKeV/w==
X-Received: by 2002:a05:6870:f69e:b0:1b0:43b6:e13b with SMTP id el30-20020a056870f69e00b001b043b6e13bmr5415910oab.54.1690013080956;
        Sat, 22 Jul 2023 01:04:40 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHTHBxJ83OPWYjyyNOUC3XHdVgTNzaset85zkOMNxYBC17Xoo0VXVQRCj/sg/zGs6W4odjxmgoFJn4fb7835PI=
X-Received: by 2002:a05:6870:f69e:b0:1b0:43b6:e13b with SMTP id
 el30-20020a056870f69e00b001b043b6e13bmr5415901oab.54.1690013080765; Sat, 22
 Jul 2023 01:04:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230716193000.231406-1-costa.shul@redhat.com> <9b212c49-ab51-0cd9-5871-c145c5f41b48@kernel.org>
In-Reply-To: <9b212c49-ab51-0cd9-5871-c145c5f41b48@kernel.org>
From:   Costa Shulyupin <costa.shul@redhat.com>
Date:   Sat, 22 Jul 2023 11:04:29 +0300
Message-ID: <CADDUTFx+tfdkLp=wp-XH-U1iB3ZM90W=ktbR4ckp62pDmUGPMg@mail.gmail.com>
Subject: Re: [PATCH] tracing/timerlat: Add latency threshold
To:     Daniel Bristot de Oliveira <bristot@kernel.org>
Cc:     linux-rt-users@vger.kernel.org,
        Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:TRACING" <linux-kernel@vger.kernel.org>,
        "open list:TRACING" <linux-trace-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> rtla timerlat has the --aa-only that ignores the trace until
> the tracing stops, and then do the auto-analysis based on the
> tail of the trace.

> So, as I said, I am not convinced that adding this interface file is
> better than setting the stop-tracing option... and then waiting for
> the trace to stop... parsing only the tail of the buffer.

I see. Stop-tracing option of rtla timerlat solves the problem for
most of the cases.

Thank you very much!
Costa

