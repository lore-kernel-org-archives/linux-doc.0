Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4A5CA7D0DA
	for <lwn-linux-doc@archive.lwn.net>; Wed, 21 Mar 2018 06:10:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751609AbeCUGJ7 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 21 Mar 2018 02:09:59 -0400
Received: from mail-pf0-f195.google.com ([209.85.192.195]:34341 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751477AbeCUGJ4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 21 Mar 2018 02:09:56 -0400
Received: by mail-pf0-f195.google.com with SMTP id j20so1632909pfi.1;
        Tue, 20 Mar 2018 23:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ertvYdK6iqR/JfTTa1x7BCp7s+I//ClF1xezB1zn3d0=;
        b=MtoDtYFmkTmKZnTcwLEJ1ASwVCYtdMFCSdC4xAUkgSbjRbEZGRwC8RymdxgQM9vsG3
         OECDgdaHqM+1vXC/fvKPR0I+9leNagYBFnPUzBZI1S8UTI7TJlTD0ce5AJeFcrjdDWQr
         nkTBK9yRLH1aCOdWLUbNMWzkwGmV777sZ5W7teKHqtaNx1YdTQ6u9pewww/E9U/I767T
         zNNhnFyQADvxeWMFaKw9OtXvISBbkAWHVOwT53GauEN7n5xTuItv8PjbXcq/QZvsyv9q
         15J5uMVmZgc94LLwDPXxbsBXlaltOKpaaNYEIxr1+sSIZdyaeTqIZ7naqGGZddqV8cMb
         ze1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ertvYdK6iqR/JfTTa1x7BCp7s+I//ClF1xezB1zn3d0=;
        b=OcXz+4pioJNT6pg2G8CaCqCDDQWjzF8pcvqsCPQSmjvsN+3iC6lSop1HPTLltBCW2q
         alw2Y3FKkjIBIHuR+5GfUYNnvHJs87SLSrndhScEm91/o7LUDJOlZTrnHVCG0dw6LDpO
         cRvvrCICBxgBq8r1yAeEXTH6uga4i+2SU/tCN1rPwtBQY3bB+DsrWhGO0xpRX7WW0IpR
         uK1lhcp7S6OQL0WgWneFaeeQB7pa/Nox4yNsPudQX1Mou6x6AZQ8uyCvcWa9yx3WWi+j
         pljmeXrJNzwKd6yc9MmHy+8tjR0ju47HQ1QMu0eP8sGzSWk3FVsCDHRCYmZKjzJNLrP2
         0w0A==
X-Gm-Message-State: AElRT7E623C72r7t5GRoIKHx/0hAtvaoIUOsT+ogaVjdEVCI/m32J+Lx
        KnrC0ITn6GvxlYoQh+tUV68=
X-Google-Smtp-Source: AG47ELumbqZ0oblAAePdt5zjgDxow7Voh5jvRDU4nsJBEdgo/m1gCJcV+ZCBFKhN3XqlJ2bvAvhhww==
X-Received: by 10.98.111.65 with SMTP id k62mr14604449pfc.184.1521612595813;
        Tue, 20 Mar 2018 23:09:55 -0700 (PDT)
Received: from server.roeck-us.net (108-223-40-66.lightspeed.sntcca.sbcglobal.net. [108.223.40.66])
        by smtp.gmail.com with ESMTPSA id z15sm6138692pfh.11.2018.03.20.23.09.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Mar 2018 23:09:54 -0700 (PDT)
Subject: Re: [PATCH V2 7/9] hwmon: pwm-fan: add sysfs node to read rpm of fan
To:     Rajkumar Rampelli <rrajk@nvidia.com>, robh+dt@kernel.org,
        mark.rutland@arm.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com, jdelvare@suse.com, corbet@lwn.net,
        catalin.marinas@arm.com, will.deacon@arm.com,
        kstewart@linuxfoundation.org, gregkh@linuxfoundation.org,
        pombredanne@nexb.com, mmaddireddy@nvidia.com,
        mperttunen@nvidia.com, arnd@arndb.de, timur@codeaurora.org,
        andy.gross@linaro.org, xuwei5@hisilicon.com, elder@linaro.org,
        heiko@sntech.de, krzk@kernel.org, ard.biesheuvel@linaro.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, ldewangan@nvidia.com
References: <1521607244-29734-1-git-send-email-rrajk@nvidia.com>
 <1521607244-29734-8-git-send-email-rrajk@nvidia.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <0da71848-1f75-62a3-75cb-a9b5cd887798@roeck-us.net>
Date:   Tue, 20 Mar 2018 23:09:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1521607244-29734-8-git-send-email-rrajk@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 03/20/2018 09:40 PM, Rajkumar Rampelli wrote:
> Add fan device attribute fan1_input in pwm-fan driver
> to read speed of fan in rotations per minute.
> 
> Signed-off-by: Rajkumar Rampelli <rrajk@nvidia.com>
> ---
> 
> V2: Removed generic-pwm-tachometer driver and using pwm-fan driver as per suggestions
>      to read fan speed.
>      Added fan device attribute to report speed of fan in rpms through hwmon sysfs.
> 
>   drivers/hwmon/pwm-fan.c | 23 +++++++++++++++++++++++
>   1 file changed, 23 insertions(+)
> 
> diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
> index 70cc0d1..8dda209 100644
> --- a/drivers/hwmon/pwm-fan.c
> +++ b/drivers/hwmon/pwm-fan.c
> @@ -98,11 +98,34 @@ static ssize_t show_pwm(struct device *dev,
>   	return sprintf(buf, "%u\n", ctx->pwm_value);
>   }
>   
> +static ssize_t show_rpm(struct device *dev, struct device_attribute *attr,
> +			char *buf)
> +{
> +	struct pwm_fan_ctx *ptt = dev_get_drvdata(dev);
> +	struct pwm_device *pwm = ptt->pwm;
> +	struct pwm_capture result;
> +	unsigned int rpm = 0;
> +	int ret;
> +
> +	ret = pwm_capture(pwm, &result, 0);
> +	if (ret < 0) {
> +		pr_err("Failed to capture PWM: %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (result.period)
> +		rpm = DIV_ROUND_CLOSEST_ULL(60ULL * NSEC_PER_SEC,
> +					    result.period);
> +
> +	return sprintf(buf, "%u\n", rpm);
> +}
>   
>   static SENSOR_DEVICE_ATTR(pwm1, S_IRUGO | S_IWUSR, show_pwm, set_pwm, 0);
> +static SENSOR_DEVICE_ATTR(fan1_input, 0444, show_rpm, NULL, 0);
>   
>   static struct attribute *pwm_fan_attrs[] = {
>   	&sensor_dev_attr_pwm1.dev_attr.attr,
> +	&sensor_dev_attr_fan1_input.dev_attr.attr,

This doesn't make sense. The same pwm can not both control the fan speed
and report it.

Guenter

>   	NULL,
>   };
>   
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
