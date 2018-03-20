Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D82DE7D0DA
	for <lwn-linux-doc@archive.lwn.net>; Tue, 20 Mar 2018 15:39:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751727AbeCTPj0 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 20 Mar 2018 11:39:26 -0400
Received: from mail-pf0-f194.google.com ([209.85.192.194]:42611 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751753AbeCTPjS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Mar 2018 11:39:18 -0400
Received: by mail-pf0-f194.google.com with SMTP id a16so774558pfn.9
        for <linux-doc@vger.kernel.org>; Tue, 20 Mar 2018 08:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:to:from:in-reply-to:cc
         :references:message-id:user-agent:subject:date;
        bh=Pt8HO4bkmSZYrVcQpQYv5vj4/77gUVAERpHzzhuJZ9U=;
        b=OrVVyw3iuNThcSDPjZX9jOaGvwkk+3ljsUg09XRaklvSS6dd9v1HDOkIM0+eZkT7G8
         fVAXYWejZodcSU2GKXmYQv3nW3CTYm3FdGtMI+BuHFcjNjcihyU95xoxSmJySNBbPREv
         UqtF0SBPwOUwYoTBS6B7g9B2sjetMnQVxWBIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding:to:from
         :in-reply-to:cc:references:message-id:user-agent:subject:date;
        bh=Pt8HO4bkmSZYrVcQpQYv5vj4/77gUVAERpHzzhuJZ9U=;
        b=UyveAGpMw50B61UaT7BWVgQIfPxY7qYlrpldB1u8rSqJsM0UKvmuCa3pjJgQI++0cG
         8q0lAI7ZS/1erUL3jdeAREn8A9rZsY18Zt2+MqNpvUaWseEKRIRkwcjSBriukoOyeo8n
         OFrSLw84ZMCzZ9b+h5rJPuW5cMkx+guPE06AWY4Q67NLSsVu/VG6ZNGrWFZfuCRzFs1B
         jorzkCCoYI7b2EcLf3CweXOP9qLQ6eu7uMpEkstqPlVCorx6ttjtqq1VHwjQkuSZKrpu
         oTpW0pL7+w+j+rKwVYlIyXvotooJVmzZudt+RXoeH+pSQ4xu/nKLdeIkA1nWJH0206Wi
         rG4w==
X-Gm-Message-State: AElRT7EzWt3eC86gYUw2bDrYADw3IjJsOdFHtW0BrfEbb/etHyxgKZwZ
        D3DKBSt1vYxiOehIQkhz+Oovig==
X-Google-Smtp-Source: AG47ELtRXrpJ14FmONvRtuop096hrXSyeM8jfA7+qtrpc4VIZr2JDTKDqFT1ifK54lTkZ7CDxkN6ZQ==
X-Received: by 10.98.244.6 with SMTP id r6mr921976pff.242.1521560357816;
        Tue, 20 Mar 2018 08:39:17 -0700 (PDT)
Received: from localhost ([2620:0:1000:1511:d30e:62c6:f82c:ff40])
        by smtp.gmail.com with ESMTPSA id n8sm4053591pff.131.2018.03.20.08.39.17
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Mar 2018 08:39:17 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Karthikeyan Ramasubramanian <kramasub@codeaurora.org>,
        andy.gross@linaro.org, corbet@lwn.net, david.brown@linaro.org,
        gregkh@linuxfoundation.org, mark.rutland@arm.com,
        robh+dt@kernel.org, wsa@the-dreams.de
From:   Stephen Boyd <swboyd@chromium.org>
In-Reply-To: <1521071931-9294-2-git-send-email-kramasub@codeaurora.org>
Cc:     Karthikeyan Ramasubramanian <kramasub@codeaurora.org>,
        linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-serial@vger.kernel.org, jslaby@suse.com,
        evgreen@chromium.org, acourbot@chromium.org,
        Sagar Dharia <sdharia@codeaurora.org>,
        Girish Mahadevan <girishm@codeaurora.org>
References: <1521071931-9294-1-git-send-email-kramasub@codeaurora.org>
 <1521071931-9294-2-git-send-email-kramasub@codeaurora.org>
Message-ID: <152156035664.254778.5247314455044000548@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH v4 1/6] dt-bindings: soc: qcom: Add device tree binding for GENI
 SE
Date:   Tue, 20 Mar 2018 08:39:16 -0700
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Quoting Karthikeyan Ramasubramanian (2018-03-14 16:58:46)
> Add device tree binding support for the QCOM GENI SE driver.
> =

> Signed-off-by: Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
> Signed-off-by: Sagar Dharia <sdharia@codeaurora.org>
> Signed-off-by: Girish Mahadevan <girishm@codeaurora.org>

Assuming Rob's comment is addressed:

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
