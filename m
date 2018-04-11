Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A71B37DE78
	for <lwn-linux-doc@archive.lwn.net>; Wed, 11 Apr 2018 11:54:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752401AbeDKLwZ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 11 Apr 2018 07:52:25 -0400
Received: from mail-qk0-f194.google.com ([209.85.220.194]:42688 "EHLO
        mail-qk0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751819AbeDKLwV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 Apr 2018 07:52:21 -0400
Received: by mail-qk0-f194.google.com with SMTP id b198so1460121qkg.9;
        Wed, 11 Apr 2018 04:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=txYX6GDr7IC9OiqUgoLl8hc0t7gEN1RLpwxxc7tEydk=;
        b=bmoRQj0mrGyq+dHmo9cnULc57DwCEtae8fKZTvjR1nvOIXGM7K7G/zFIjfu1wMjtoc
         /q2NBCQzjoBZz7QYYUNzUyegu2x8FkrlJ8mORB9YZKGK0XuEAfW/7luMdS6lglZIyolp
         few/sOWReu/YHjtgGeLMoTJQXqaUHWqsVqN5b8HwQbqrDVnPgLUk9tIKl0d0B5syQ0fK
         VPFSsV8OQHXP3HT4mKw/lm4Mn99OL12IHACRk5qiEVvsa+YLnTGoyuXI+lr3lXVbybMG
         m4hv6GwkORVHKSfNAIhlBg0i8bNfCe500RO57OluhUFhQgV1H9k9XaqWj4N4ijGTT00i
         r3fQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=txYX6GDr7IC9OiqUgoLl8hc0t7gEN1RLpwxxc7tEydk=;
        b=OSiQOki2oXk20DpTJYiD+4sVCSFDLGpRXDancjoHG83KuM53RmSAD5NCTsKTqs5bIp
         QbCbHZYf1qDWa9CV+ruoF9MfkIu7ZOi9lZcdd4355i98vv/tO3sRILqW0lgrV52WfuFI
         K3e5fPYdtCraGKvErUsGwSoXofdNN21yKleDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
         :date:message-id:subject:to:cc;
        bh=txYX6GDr7IC9OiqUgoLl8hc0t7gEN1RLpwxxc7tEydk=;
        b=cEjIMnTllvlJCmctVqrpKlBDCz+qfaZzsOJfb+dZbAER3gyJ1JFH7zktU4hj+iS2L/
         hLPL/qXr+KzD9ru+UBVKZA825g6z5oozk9hkbiciF+hVJwz8uQXPskpugplEfucijUap
         LxTcYoLxwKGwOo54IxhXb0D+/Yxj9t9kUqE4atAT2xI0nU2qS2hGYlyIUFNuaYpoWYe4
         ImLAosV4cEwoxSf5kR7Vqz5MNz09IIAlYLYqK4TJKp5nWoPl2mQyr1yvj/reKyzIWY9X
         IjXLGH1zUPnGtTE8qe29Jk6vvhK8wZ+bypTiKU9vXALh6oc4InaK1dO58uvSx/i7zshK
         /HTg==
X-Gm-Message-State: ALQs6tDcDQm9ZW7+o//+uO3aiXxsUplOTxu4mHrrq485rhl6nSHKeNR5
        rvHYav89jLWtR6MOnmk8mXD+yF0uFSpkwxmLxyQ=
X-Google-Smtp-Source: AIpwx4/W6HosTJLpgajgov4mosY8NK7oZ+9TfAI+BLxUlxvc2rWUAvg8E5rgTJQwCy96nxxN9Q4nnbl74zsYAq6rK0U=
X-Received: by 10.55.246.26 with SMTP id y26mr6235208qkj.127.1523447540754;
 Wed, 11 Apr 2018 04:52:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.63.197 with HTTP; Wed, 11 Apr 2018 04:52:00 -0700 (PDT)
In-Reply-To: <20180410183212.16787-2-jae.hyun.yoo@linux.intel.com>
References: <20180410183212.16787-1-jae.hyun.yoo@linux.intel.com> <20180410183212.16787-2-jae.hyun.yoo@linux.intel.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Wed, 11 Apr 2018 21:22:00 +0930
X-Google-Sender-Auth: DmTtIusvZxLPm4AV0-klbDdTn2s
Message-ID: <CACPK8XfwVTKfOQSteY8-Dy2=YiC6qjd1qZ2f8n1hTv8w06DWRg@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] Documentations: dt-bindings: Add documents of
 generic PECI bus, adapter and client drivers
To:     Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Alan Cox <alan@linux.intel.com>, Andrew Jeffery <andrew@aj.id.au>,
        Andrew Lunn <andrew@lunn.ch>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Fengguang Wu <fengguang.wu@intel.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Haiyue Wang <haiyue.wang@linux.intel.com>,
        James Feist <james.feist@linux.intel.com>,
        Jason M Biils <jason.m.bills@linux.intel.com>,
        Jean Delvare <jdelvare@suse.com>,
        Julia Cartwright <juliac@eso.teric.us>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Milton Miller II <miltonm@us.ibm.com>,
        Pavel Machek <pavel@ucw.cz>,
        Randy Dunlap <rdunlap@infradead.org>,
        Stef van Os <stef.van.os@prodrive-technologies.com>,
        Sumeet R Pawnikar <sumeet.r.pawnikar@intel.com>,
        Vernon Mauery <vernon.mauery@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-doc@vger.kernel.org, devicetree <devicetree@vger.kernel.org>,
        linux-hwmon@vger.kernel.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Jae,

On 11 April 2018 at 04:02, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
> This commit adds documents of generic PECI bus, adapter and client drivers.
>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Reviewed-by: Haiyue Wang <haiyue.wang@linux.intel.com>
> Reviewed-by: James Feist <james.feist@linux.intel.com>
> Reviewed-by: Vernon Mauery <vernon.mauery@linux.intel.com>
> Cc: Alan Cox <alan@linux.intel.com>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Andy Shevchenko <andriy.shevchenko@intel.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Fengguang Wu <fengguang.wu@intel.com>
> Cc: Greg KH <gregkh@linuxfoundation.org>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Jason M Biils <jason.m.bills@linux.intel.com>
> Cc: Jean Delvare <jdelvare@suse.com>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Julia Cartwright <juliac@eso.teric.us>
> Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
> Cc: Milton Miller II <miltonm@us.ibm.com>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Cc: Stef van Os <stef.van.os@prodrive-technologies.com>
> Cc: Sumeet R Pawnikar <sumeet.r.pawnikar@intel.com>

That's a hefty cc list. I can't see Rob Herring though, and he's
usually the person who you need to convince to get your bindings
accepted.

I recommend using ./scripts/get_maintainers.pl to build your CC list,
and then add others you think are relevant.

I'm not sure what the guidelines are for generic bindings, so I'll
defer to Rob for this patch.

Cheers,

Joel

> ---
>  .../devicetree/bindings/peci/peci-adapter.txt      | 23 ++++++++++++++++++++
>  .../devicetree/bindings/peci/peci-bus.txt          | 15 +++++++++++++
>  .../devicetree/bindings/peci/peci-client.txt       | 25 ++++++++++++++++++++++
>  3 files changed, 63 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/peci/peci-adapter.txt
>  create mode 100644 Documentation/devicetree/bindings/peci/peci-bus.txt
>  create mode 100644 Documentation/devicetree/bindings/peci/peci-client.txt
>
> diff --git a/Documentation/devicetree/bindings/peci/peci-adapter.txt b/Documentation/devicetree/bindings/peci/peci-adapter.txt
> new file mode 100644
> index 000000000000..9221374f6b11
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/peci/peci-adapter.txt
> @@ -0,0 +1,23 @@
> +Generic device tree configuration for PECI adapters.
> +
> +Required properties:
> +- compatible     : Should contain hardware specific definition strings that can
> +                  match an adapter driver implementation.
> +- reg            : Should contain PECI controller registers location and length.
> +- #address-cells : Should be <1>.
> +- #size-cells    : Should be <0>.
> +
> +Example:
> +       peci: peci@10000000 {
> +               compatible = "simple-bus";
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               ranges = <0x0 0x10000000 0x1000>;
> +
> +               peci0: peci-bus@0 {
> +                       compatible = "soc,soc-peci";
> +                       reg = <0x0 0x1000>;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +               };
> +       };
> diff --git a/Documentation/devicetree/bindings/peci/peci-bus.txt b/Documentation/devicetree/bindings/peci/peci-bus.txt
> new file mode 100644
> index 000000000000..90bcc791ccb0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/peci/peci-bus.txt
> @@ -0,0 +1,15 @@
> +Generic device tree configuration for PECI buses.
> +
> +Required properties:
> +- compatible     : Should be "simple-bus".
> +- #address-cells : Should be <1>.
> +- #size-cells    : Should be <1>.
> +- ranges         : Should contain PECI controller registers ranges.
> +
> +Example:
> +       peci: peci@10000000 {
> +               compatible = "simple-bus";
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               ranges = <0x0 0x10000000 0x1000>;
> +       };
> diff --git a/Documentation/devicetree/bindings/peci/peci-client.txt b/Documentation/devicetree/bindings/peci/peci-client.txt
> new file mode 100644
> index 000000000000..8e2bfd8532f6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/peci/peci-client.txt
> @@ -0,0 +1,25 @@
> +Generic device tree configuration for PECI clients.
> +
> +Required properties:
> +- compatible : Should contain target device specific definition strings that can
> +              match a client driver implementation.
> +- reg        : Should contain address of a client CPU. Address range of CPU
> +              clients is starting from 0x30 based on PECI specification.
> +              <0x30> .. <0x37> (depends on the PECI_OFFSET_MAX definition)
> +
> +Example:
> +       peci-bus@0 {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               < more properties >
> +
> +               function@cpu0 {
> +                       compatible = "device,function";
> +                       reg = <0x30>;
> +               };
> +
> +               function@cpu1 {
> +                       compatible = "device,function";
> +                       reg = <0x31>;
> +               };
> +       };
> --
> 2.16.2
>
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
