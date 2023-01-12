Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2A9FC54EBE
	for <linux-doc@archiver.kernel.org>; Thu, 12 Jan 2023 19:56:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229917AbjALT4r (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 12 Jan 2023 14:56:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229800AbjALT4Z (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 12 Jan 2023 14:56:25 -0500
Received: from mx.kolabnow.com (mx.kolabnow.com [212.103.80.153])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B93F8200F;
        Thu, 12 Jan 2023 11:56:01 -0800 (PST)
Received: from localhost (unknown [127.0.0.1])
        by mx.kolabnow.com (Postfix) with ESMTP id 3F0BA47206;
        Thu, 12 Jan 2023 20:55:59 +0100 (CET)
Authentication-Results: ext-mx-out003.mykolab.com (amavisd-new);
        dkim=pass (4096-bit key) reason="pass (just generated, assumed good)"
        header.d=kolabnow.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolabnow.com; h=
        in-reply-to:content-disposition:content-type:content-type
        :mime-version:references:message-id:subject:subject:from:from
        :date:date:received:received:received; s=dkim20160331; t=
        1673553356; x=1675367757; bh=ymQw9MaNL66asGkSLYyB1FHEAJLENfpL+HS
        qkDjzQJ8=; b=X+Q3s3A/WqhCr4v8RdLwD9mQ12Hx9hj1NY422u7j8yftx9SDyOF
        RmvK2+DZzKj6l/du+XVsf5N6UJ3EDttVzr5zBXdG5QcgFXK3fMk/wmboGVn95v6t
        nyXL9etsMaUooWVkh4oKl1bw6VMECtsTIucyIortuMrRWwO9r6NT7bmbIaAb4Csf
        WYfn3Lcq8dh1DaSwdQLyCTQA/eA26bWRMKM1WVlTU6mnVgw6AK0WhYAD9B6vLEL6
        0fE2lznS2X5fhB3MJB8YERfiCDeQoCrLoNzUXbBWWyPcTITZKWc8F1Vb27i3bFTV
        I3Iy/2D7/AakuYwbSnb+Ay/xTN3rR27L3cQVRPq7Zw3SM8K5WnGqYpXGjx1NHEeK
        o99AulLAt0fux1jMq30eQmb3Rsh5iQMgJcmLtUDjSSk02NbDTIDN1mHylvKr7wMA
        +IQRrCf9WZ9W2t7XAHNn1w+ZmN3CgPU4d0mJV9a7ODfyBps23Y7GLYp0bIjb04RA
        Mfmwx1EB4wIpWe94uQvyaGxWyf/6oPMkFYR12b2FlyPS6xDwTgAs5/UK3ljwdytQ
        9OIcZpABeggbqXOVBI50Nbqd8QIwzQ+llausiygm/2tIlMSYyrKg0MlfsaOBcH+1
        bKLazgezHF2yhWxMPXNsBmPpgHReYFy9Q8N6Z1wn0eCDYqOj1P7vOgRo=
X-Virus-Scanned: amavisd-new at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
        by localhost (ext-mx-out003.mykolab.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id y4r5nY76Npyj; Thu, 12 Jan 2023 20:55:56 +0100 (CET)
Received: from int-mx002.mykolab.com (unknown [10.9.13.2])
        by mx.kolabnow.com (Postfix) with ESMTPS id 9F04A47205;
        Thu, 12 Jan 2023 20:55:55 +0100 (CET)
Received: from ext-subm001.mykolab.com (unknown [10.9.6.1])
        by int-mx002.mykolab.com (Postfix) with ESMTPS id 60A834EB1;
        Thu, 12 Jan 2023 20:55:55 +0100 (CET)
Date:   Thu, 12 Jan 2023 20:55:52 +0100
From:   Federico Vaga <federico.vaga@vaga.pv.it>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2] doc: monospace style for inline code in botching ioctl
Message-ID: <20230112195552.qapndatj66nqmu4n@numero-86.vaga.pv.it>
References: <20230102183649.9626-1-federico.vaga@vaga.pv.it>
 <874jswwuc2.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <874jswwuc2.fsf@meer.lwn.net>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jan 11, 2023 at 03:59:57PM -0700, Jonathan Corbet wrote:
>Federico Vaga <federico.vaga@vaga.pv.it> writes:
>
>> Highlighting inline code improves text readability.
>>
>> Signed-off-by: Federico Vaga <federico.vaga@vaga.pv.it>
>
>It improves *HTML* text readability; the results for plain text are
>... less clear.  I think it's better to avoid this kind of extra markup
>when we can.

Shouldn't we consider higher priority the HTML text? Perhaps I've a biased
opinion. Do you think that plain-text is the favorite way of reading the kernel
documentation?

Let me profit from this point and ask. Are there statistics about the usage of
https://www.kernel.org/doc/html/latest/?


>Thanks,
>
>jon

-- 
Federico Vaga
