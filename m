Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BDEBB7D910
	for <lwn-linux-doc@archive.lwn.net>; Thu,  1 Aug 2019 22:07:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731202AbfHAWH5 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 1 Aug 2019 18:07:57 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:33699 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727954AbfHAWH5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Aug 2019 18:07:57 -0400
Received: by mail-ot1-f67.google.com with SMTP id q20so75910765otl.0
        for <linux-doc@vger.kernel.org>; Thu, 01 Aug 2019 15:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=android.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+d66Dx5tht3bIubrAALEmO9FsXpeA3XHRtZ+CvWmAzQ=;
        b=b5JIUkRUV0g59d/ktuCiATKF7wwGGFI9elm07cwD5p+GrVFeSMqW8t1QuZqlT1lT7y
         ed+UfqDJmE+n4XHon639NUlemgv3jgQaFEYF6LXE4UmBeT47f+sfUqH+5kPb1NreUves
         5wSgSHWJzrDu8+wbKPmaiR5XdtPtBBf3cnZmuUE3zk1JMeio47Ca+38vgBViUeoS58HS
         CL2rDz4g695xAEIoJ2RRgpV7rvL9+gSWWkmtTUf6jUEQgJyZ9aFFBmLUCrA63SnEi+2b
         mAoeICiQI6icOfuZ+SuvMCXYiVe9cWDj4PYp04G5vewtmMD41nT3cOgQRdX/9MQP6FE1
         5FXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+d66Dx5tht3bIubrAALEmO9FsXpeA3XHRtZ+CvWmAzQ=;
        b=IkgupGjjbOmX8NJPoG15+cRpolE21IMXOxvwOtFF8ZnJmJob2Gu7e4DwIyFHLTv8z2
         58OBcAlvl/Zsa1jYLPqrzQcMFepFvsZvaxE64PW9EuXvvogBAkb/npwaxp2iY4YbILsn
         TMjCz+ZpGQrNKdaLjeCRgUCrTUsXzfks+Tj7O/5ULXdCIvntdgSJMctK2rzcgdwGL+zu
         NSYR8CjLaB49060Rg2Vra4ZwJKqGAOUpUoi4KGNVisk6tIV6S8N56XMtacCqAOLyBBsQ
         efq3YXud6w/DkLJh2TD+G+DzqDJnbq5HYygMstr5IjKzInfNRyIL+PCCA5fEWmQSdDjX
         Ijmw==
X-Gm-Message-State: APjAAAVADJM9KBaRgDuxZJM+XrnCPxLdMwLhIeFTDQhK0OlwZtRl3z+/
        Nic3eOLgubYQHXTsGsHXxLlgB0cXo2x2gn/pKzo=
X-Google-Smtp-Source: APXvYqztC6d2JL7T5A6ZXy62TT29JOHO4N1GO1DWFj/SVQmPqGS95r35F5QH7LXc9/LPGu7z2wVsfuB0ezqnAqTHt7k=
X-Received: by 2002:a05:6830:13d9:: with SMTP id e25mr67528087otq.197.1564697276304;
 Thu, 01 Aug 2019 15:07:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190730212048.164657-1-swboyd@chromium.org> <20190730212048.164657-2-swboyd@chromium.org>
In-Reply-To: <20190730212048.164657-2-swboyd@chromium.org>
From:   Tri Vo <trong@android.com>
Date:   Thu, 1 Aug 2019 15:07:45 -0700
Message-ID: <CANA+-vDCauCh-Ds3xVawYAhWyLpFHqn92fdYL316M5GfxTGvZA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] idr: Document that ida_simple_{get,remove}() are deprecated
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Matthew Wilcox <willy@infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jul 30, 2019 at 2:20 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> These two functions are deprecated. Users should call ida_alloc() or
> ida_free() respectively instead. Add documentation to this effect until
> the macro can be removed.
>
> Cc: Greg KH <gregkh@linuxfoundation.org>
> Cc: Tri Vo <trong@android.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Reviewed-by: Tri Vo <trong@android.com>
