Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E416CC77B75
	for <linux-doc@archiver.kernel.org>; Tue, 18 Apr 2023 08:09:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229901AbjDRIJ3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 18 Apr 2023 04:09:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231264AbjDRIJY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 18 Apr 2023 04:09:24 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87B747EFC
        for <linux-doc@vger.kernel.org>; Tue, 18 Apr 2023 01:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681805229;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=9LaUC9tg4G2l6nVpqrdOieDitZKZLzXClLpOb7J+e8k=;
        b=cW0BHTlxd1PAQVhvbwlE2R+n2EfvR2JDbKr/WMMnD23pa8NRNFtKtKc1lBiqsPDVlT+5TM
        xpnOUYo2OqiZSFfrFxKqzVE+F5XBK/QWXRmEjxCMTajN7KJJUcs2yjQm5hUv29hQIV34i/
        1mMHwzofUH8rt0OR16Wr4m6mz95vIS0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-70-4fePVcbLMsKRVofs-SxgYw-1; Tue, 18 Apr 2023 04:03:57 -0400
X-MC-Unique: 4fePVcbLMsKRVofs-SxgYw-1
Received: by mail-wm1-f69.google.com with SMTP id d8-20020a05600c3ac800b003edf7d484d4so8773776wms.0
        for <linux-doc@vger.kernel.org>; Tue, 18 Apr 2023 01:03:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681805036; x=1684397036;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9LaUC9tg4G2l6nVpqrdOieDitZKZLzXClLpOb7J+e8k=;
        b=dqMyWFUDzrXd96Kdp2cjUtfFZ37E0TphS6RZ6l+Wpd56C09nD4x51KXzw9ZPUsEdx+
         K4OPBOH0P38pX4W9d5GmnaqbdRkFSi0kPFWe+zdFSKIKTDclYqbpL0S1SUHib21AB/bl
         HPd8qVP4PLbJqrul1OUaHEfvw1SxRaUlTRkuawsRvu+KYessvPFbvGzIdtgyi05rLoby
         Kswlo2aoDerJwth8cgSf3ew9+GbXH0ELUldp8bCGuLkmS6lgIGGKZX28UL63+y3AALHr
         lFSh05uwW8O/0pl164pe6IMDfTEJh40xprHDymUj5gCZ+GIva2jvaux4cSihu4vh3zEI
         lDww==
X-Gm-Message-State: AAQBX9f/fduGx8NpUTarDuIF3PyRiPo+GZGSQ0c8lYu9UP5lkpcxkiaI
        Z1mL7WXjLpGiqnXk2NBeRAC/n7KjXtaj1gj4kIgqAgQ9WVPL4uK0kNuOF3LLTaz+i/JNElueD9l
        RZI0RVrpO6o1WZLo5QupG
X-Received: by 2002:a7b:cd10:0:b0:3ee:672d:caa3 with SMTP id f16-20020a7bcd10000000b003ee672dcaa3mr13809179wmj.18.1681805036825;
        Tue, 18 Apr 2023 01:03:56 -0700 (PDT)
X-Google-Smtp-Source: AKy350YgRexEYOBjpcJXKFiZdltKyrmIp9qx+iJEmZye/XjE1blMO25oLBRoJBR3OVmGLoZhVR2fng==
X-Received: by 2002:a7b:cd10:0:b0:3ee:672d:caa3 with SMTP id f16-20020a7bcd10000000b003ee672dcaa3mr13809158wmj.18.1681805036491;
        Tue, 18 Apr 2023 01:03:56 -0700 (PDT)
Received: from debian ([92.62.32.42])
        by smtp.gmail.com with ESMTPSA id 26-20020a05600c021a00b003f17848673fsm1720374wmi.27.2023.04.18.01.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 01:03:56 -0700 (PDT)
Date:   Tue, 18 Apr 2023 10:03:53 +0200
From:   Guillaume Nault <gnault@redhat.com>
To:     Samuel Thibault <samuel.thibault@ens-lyon.org>,
        Dominique Martinet <asmadeus@codewreck.org>,
        James Chapman <jchapman@katalix.com>, tparkin@katalix.com,
        edumazet@google.com, davem@davemloft.net, kuba@kernel.org,
        pabeni@redhat.com, corbet@lwn.net, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PPPoL2TP: Add more code snippets
Message-ID: <ZD5O6VzyEAggakb2@debian>
References: <20230416220704.xqk4q6uwjbujnqpv@begin>
 <ZDx2IUYTmLSdzU6D@codewreck.org>
 <20230416224316.xlvgjor65nejldwh@begin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230416224316.xlvgjor65nejldwh@begin>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Apr 17, 2023 at 12:43:16AM +0200, Samuel Thibault wrote:
> Dominique Martinet, le lun. 17 avril 2023 07:26:41 +0900, a ecrit:
> > Also, this got me wondering if the 'if' fd can be closed immediately or
> > if the interface will be removed when the fd is closed (probably not?)
> 
> Closing the fd would close the if, yes. AIUI one really has to keep the
> pppox socket (for stats), the ppp chan (for non-data ppp packets), and
> the ppp if (for the if).

L2TP has control and data packets. The L2TP socket is there to handle
L2TP control packets in user space, as the kernel only handles L2TP
data packets. You have to keep the L2TP session socket open, otherwise
you can't handle the session anymore.

Then there are the PPP file descriptors. A PPP channel is used to send
and receive PPP frames. It has to be associated with a lower transport,
for example an L2TP session if you want to encapsulate PPP into L2TP.
But that could be something else (a PPPoE session, a serial link, etc.).
Same as for L2TP session sockets, you need to keep the PPP channel fd
open, otherwise you can't handle the PPP session anymore.

Finally there are PPP units. A PPP unit represents the PPP networking
device (like ppp0). A PPP unit has to be associated with a PPP channel
(or several PPP channels for multilink PPP, but better avoid that). A
PPP unit doesn't know how to send packets, it delegates that to its PPP
channels.

You can avoid creating PPP units if you don't need a PPP network
device. In particular, if you're forwarding a PPP session between a
PPPoE and an L2TP session (or between two different L2TP sesions), you
typically don't need to create any PPP unit. You handle the initial LCP
negociation and PPP authentication using a PPP channel on the incoming
side, then you create another PPP channel on the other side (where you
want to forward the incoming PPP session) and finally bridge them
together with PPPIOCBRIDGECHAN.

> Samuel
> 

