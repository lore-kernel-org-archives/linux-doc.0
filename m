Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 852647DD31
	for <lwn-linux-doc@archive.lwn.net>; Thu, 29 Mar 2018 10:02:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752427AbeC2KC4 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 29 Mar 2018 06:02:56 -0400
Received: from mail-lf0-f65.google.com ([209.85.215.65]:36252 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752647AbeC2KCz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Mar 2018 06:02:55 -0400
Received: by mail-lf0-f65.google.com with SMTP id z143-v6so7608255lff.3;
        Thu, 29 Mar 2018 03:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wMK3qv4AfPRuuXFAOIamWWMyrVwYS5NWHy2NF0x1z5k=;
        b=kIYhmHzzTwIsx3vUN0cQSLY3+qi3Td5P0qIOuxAHKJTSVhTP/itB3Qwr0j36B1Mw7i
         5QET+kvdSX5V6/Ob8N90QsCjxEqJUbjNWsgLrU2YCP9/xKEIB99frqjy9xb046z7VFBj
         HRCpbLjd+nvxQnxQNOsQezGPzwpqFH3RkNEhejmB2cdTKYXOpXt3EftdxGjLx1051Xhx
         WP9D+3szMs6iKk+rJXIpdvWNYDzT5RxR52hpR8iQ5/9DBPlgNE/UwmBkBEllqp9b97We
         D6PcavLlbLURB5mZz1oZOskEr20OMccu9EXuuWQzeLghnl4MQrBgZMLIXeuZ3QpoT1ef
         n2nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=wMK3qv4AfPRuuXFAOIamWWMyrVwYS5NWHy2NF0x1z5k=;
        b=b29Jssph/0iu8WblAhyZz8zKCv+clMiyG42V9NFryBb/fdeLHaeoUNxQs8B0UAf1pX
         LW/d+jPJX8AiRzfVUrrzExSmvYpM1B+nNgjdoUK+TOgVddrcjcjlO2vZB30WUyOCmI/n
         Q+U2FKGzf2rY8N3l515hGFCF6AlI1t7KyszIljsng/ejI+fht+TCKvXiYmgBI+1z3AeC
         CRPFTtv7Hw4OMxzi60Ncg/aS+Gk+NgLavDNrfrXW1wSiGVO7HNpLyYcwPmpxvTPKMoJN
         oYUrU5OMt4j2XWf81+7L5HRnrnnry0C6UKz3Au+TGy3kzIb6TIyFGvV11MPOpSA9b7HM
         61Bg==
X-Gm-Message-State: AElRT7FWu1wTYfWjWoK37+sxveuHp0axQW1RYDZM+Oy5Rg0AaS6iW6aA
        GwQsJABkQdWaCIU7WIhmhNo=
X-Google-Smtp-Source: AIpwx48OxFm598CgjX7GuEn7m/sF9EuWudzkX+8qj3/2hEIzrktRze3hUXztVKykuh3XjxHQ1yhH/g==
X-Received: by 10.46.66.82 with SMTP id p79mr4867320lja.57.1522317774031;
        Thu, 29 Mar 2018 03:02:54 -0700 (PDT)
Received: from xi.terra (c-8bb2e655.07-184-6d6c6d4.cust.bredbandsbolaget.se. [85.230.178.139])
        by smtp.gmail.com with ESMTPSA id u13-v6sm1066849lff.72.2018.03.29.03.02.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Mar 2018 03:02:52 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.90_1)
        (envelope-from <johan@kernel.org>)
        id 1f1UOV-0005XB-UV; Thu, 29 Mar 2018 12:02:56 +0200
Date:   Thu, 29 Mar 2018 12:02:55 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Sanjeev Gupta <ghane0@gmail.com>
Cc:     corbet@lwn.net, gregkh@linuxfoundation.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation/usb: Fix dead links and convert others to
 https
Message-ID: <20180329100255.GA16578@localhost>
References: <20180328160752.17840-1-ghane0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180328160752.17840-1-ghane0@gmail.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Mar 29, 2018 at 12:07:52AM +0800, Sanjeev Gupta wrote:
> All links checked, for those dead, I have replaced with copies on
> archive.org.  For some, https is not supported, http has been
> kept.
> 
> The git log says this was last done by Justin P. Mattock in 2010.
> Hi, Justin!

Not sure this belongs in the commit message (and did you forget to CC
Justin?).

> Signed-off-by: Sanjeev Gupta <ghane0@gmail.com>
> ---
>  Documentation/usb/usb-serial.txt | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
  
>    For any questions or problems with this driver, please contact Hugh
>    Blemings at hugh@misc.nu
> @@ -436,7 +437,8 @@ Winchiphead CH341 Driver
>    also implements an IEEE 1284 parallel port, I2C and SPI, but that is not
>    supported by the driver. The protocol was analyzed from the behaviour
>    of the Windows driver, no datasheet is available at present.
> -  The manufacturer's website: http://www.winchiphead.com/.
> +  The manufacturer's website:
> +  https://web.archive.org/web/20170911133726/http://winchiphead.com/ .

AFAICT this link is still working.

Johan
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
