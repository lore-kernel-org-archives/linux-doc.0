Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A09E57D04D
	for <lwn-linux-doc@archive.lwn.net>; Sat,  5 Jan 2019 20:04:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726270AbfAEUEs (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 5 Jan 2019 15:04:48 -0500
Received: from mx.kolabnow.com ([95.128.36.42]:20218 "EHLO mx.kolabnow.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726267AbfAEUEs (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 5 Jan 2019 15:04:48 -0500
X-Greylist: delayed 380 seconds by postgrey-1.27 at vger.kernel.org; Sat, 05 Jan 2019 15:04:47 EST
Received: from localhost (unknown [127.0.0.1])
        by ext-mx-out003.mykolab.com (Postfix) with ESMTP id 54FD740B2E;
        Sat,  5 Jan 2019 20:58:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolabnow.com; h=
        message-id:references:in-reply-to:subject:subject:from:from:date
        :date:content-transfer-encoding:content-type:content-type
        :mime-version:received:received:received; s=dkim20160331; t=
        1546718305; x=1548532706; bh=OWOU6jVvBTyX5WrHHLY3STg0P3ljGjvzNb1
        +fhiGCRM=; b=SgS0fxm0GyviSYNUiGs/2db7p3borcn0GknozlYDdHb48gwz5pO
        4arRFACrWlviEbljvcvvS4122JUiIOfEkCFjGo+/A8Dd5zWiNdTpwoOfNiz1Rgd3
        EuWfGyjcdX5vieyMLrNynp5EyTSo9mUkl43JddecWapRhe6+G9XJ1sJKEtBH8h3h
        J1SDdfr6X9xVfOisTUwybLK+k6MkFvnMsV3/FDlY2gRV022zwNUOFQsxUoWELU9x
        fl5dwVggsyeld1fhXKiISfu8sui8qXnX+ifhmJPmvLjq/O2c8d9rH5PjI5w7gE5O
        BaDKm1HaGPkp2Qt1vHfhz7sPxCoJbpkqG+7urZW3CvtN9Kj8R43eTJ8Yb1nDjP8d
        NUoApLT7CDsn5QVlBXxYSWvlUTy/QZo1a28kTAR+qz/Xj5GRtWQ3NYrobeqUx1Kx
        G23QttyHmX/8zlI8XCN3WbGBvsc3m9iVP8vxcCchGjD+SO2dPWyIaAAWXbjPKqCO
        ck/a/Ez+kzwkSUV1INyhwPNZQy2PumFzIGew2IUwnT6nFSRrfSvAJBtpi6o28GvH
        GzhpFq1XM4CDKFCzZm4VVBQivYqSxhFhrTorTrNF5ODM7MgssMbZPKcy7caReTvD
        XtzRRvt4PdG+T10YEj/+LAxW+F8ZaGh6i2/sa0l7Ks2cp/fqBYltfZ6k=
X-Virus-Scanned: amavisd-new at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
        by localhost (ext-mx-out003.mykolab.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id JxbCbPxUmc4q; Sat,  5 Jan 2019 20:58:25 +0100 (CET)
Received: from int-mx002.mykolab.com (unknown [10.9.13.2])
        by ext-mx-out003.mykolab.com (Postfix) with ESMTPS id 70118409EE;
        Sat,  5 Jan 2019 20:58:25 +0100 (CET)
Received: from int-subm001.mykolab.com (unknown [10.9.37.1])
        by int-mx002.mykolab.com (Postfix) with ESMTPS id 084B42588;
        Sat,  5 Jan 2019 20:58:18 +0100 (CET)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Sat, 05 Jan 2019 11:58:15 -0800
From:   Alison Chaiken <alison@she-devel.com>
To:     Bart Van Assche <bvanassche@acm.org>
Cc:     Federico Vaga <federico.vaga@vaga.pv.it>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Matthew Wilcox <willy@infradead.org>,
        "Geyslan G . Bem" <geyslan@gmail.com>,
        Tiago Natel de Moura <tiago4orion@gmail.com>,
        Joe Perches <joe@perches.com>, Li Yang <leo@zh-kernel.org>
Subject: Re: [PATCH] Documentation/CodingStyle: Use directory-local variables
 for emacs
In-Reply-To: <1546641550.83374.8.camel@acm.org>
References: <20190104210834.89231-1-bvanassche@acm.org>
 <1951386.HLNclI27qt@harkonnen> <1546641550.83374.8.camel@acm.org>
Message-ID: <84ce7ee302856836b922cfe0ddf2a74e@she-devel.com>
X-Sender: alison@she-devel.com
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2019-01-04 14:39, Bart Van Assche wrote:
>> As a general comment, I personally think that it worth to mention the 
>> fact
>> that the user can take this code (actually part of it) and put it in a 
>> .dir-
>> locals.el file in the top-level directory.
> 
> I'm not sure we should recommend this. Settings in ~/.emacs are not 
> affected
> by git clean -f -x but .dir-locals.el is removed by that command.

Why not add the file to .gitignore, possibly in a separate patch?

-- Alison

---
Alison Chaiken                   alison@she-devel.com
http://she-devel.com
The real trolley problem is that trolleys are underfunded.  -- Alex Roy
