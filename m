Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA75F4E66DD
	for <linux-doc@vger.kernel.org>; Thu,  3 Sep 2026 15:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788450230; cv=none; b=TgwW+nGRZVGs3kUluziBgSayTiTT7zI0dNbPVQD2b1NTutfzfxiNLHwAe7YcUcUtsi7PQOwZummf9F1O/9eSc9JyYbVAAwI1wAZt8GllAnJOMbKtwnAnlFd02PcytDbrwaVO8zpHvZNwhSWgePeGd6lEGERq03oC0QzLm3M+cMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788450230; c=relaxed/simple;
	bh=3+nMBA2Tlo1PYEDpyj+jPk68G8jOx5DKBwKdopxfliw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DwtCMjeEFIvztJGLauHVWHmx2spCF6bvMtthFdjjKDatD+upyZyMBIIW6gg5E82PolqN8jzEMYzwlYaGSkaQMKa/UmlLn+wudu9A7b5ywQBz3M3iiSXO+i5rmUc3HNfYZmhkqcgZvcKCQAsJz1f6wRCuJ3W6oNmL4EQNaFxpetY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eu3YJuee; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eu3YJuee"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-66f7f62e915so2863093d50.3
        for <linux-doc@vger.kernel.org>; Thu, 03 Sep 2026 08:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788450227; x=1789055027; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bI1BhV68G1oPj0x4CKbgOGcd6eU2wirBl/zG9TZ5s3A=;
        b=eu3YJueeadbLxIOzYzlgSSFfd6Y4MuUdfuhyufmzc43IvfyrdTHXXfpP5yX/M6ueaL
         gMEjNO4ASRzPEOu+LHaPriCBqskBwo9Sm7v9WPRBEpknWOAMxxqGnSpV0UnqMo9IRaYV
         +1Ad5COq+tCcEAz0fy8hLKbbNrA0q3zxN6+KYp3q/zweJrSmOPa9tZu7PZWhTfskKboi
         11lyqmEhemZ0CDf64NJt1HYQew/iTiFGCam3KqUlNNTbo0qVfHaB+Ky8co6V0nL/tvYy
         2PHWraYn3TCNPb32vX9Sy8yoGA3DrNYHk1T1vKVag3XXpy4szmp9LhkSB+RhZoWhxCaT
         KE2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788450227; x=1789055027;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bI1BhV68G1oPj0x4CKbgOGcd6eU2wirBl/zG9TZ5s3A=;
        b=SAl2Gk0t37XljFYESaDyLX635XoieAh8b8DMtebXthZ58CyCfEsX1EsXAL4Sr3QJIW
         4isSYdjUFDNcSBqFqs4OBbgp3Luj0fNkVUNLuXUFkaqFGnqR0R/BHMA6SmLnvE4jOaJv
         Fx5GsZQrUQpPn7RjxWgi/gPAcjQj+c/eIx6hlvimDDlX57VB21UMbDBI6GT/jb6LAe2e
         JFO85D13KuBMiznruyr2q7q4wiEPPMoC8bo8jhaNbkv9A++8I9O0M3TQ2CFeJojRT4CJ
         jpm/3oy4Av0EVmhzFMdGiTY29Jm6SBbKekLvQmcjJYi2zKx0aO5GjxpwfoOFhWlXBcKe
         rlBg==
X-Forwarded-Encrypted: i=1; AKwUvBxcK5MUtKuc1xnNA3SUVr/C2id8F1NnXAxJ3khni5UInTV417gm+aSFf1xei8+4nYuj9PouV7GcBDA=@vger.kernel.org
X-Gm-Message-State: AFuF++ms7+6CNzYNKglambqhbL2jgZcSDNNjrEhB1qfmm1MpEAZWgYGT
	wvP55KvX4j39IZxnGoTCEMUlxBWUX7Sq9zcRpeBeo1Ns/i8eFHfPYjiR
X-Gm-Gg: AYBFou0TmhdjiHu/la7+AhFA3uhK/ZvsJKzHAsc9VydRMvsfC5VdYrs8xsGfUz/+6Yk
	nkoOQT7v6WQq9xZfsAj0dN9SZzqrOMaurM1+aaDq3eUA4p+CrnUDinrJvuyINm6pFLfOIvJBGEZ
	s/o4GHAHPA0CDNgd/adx8PJ+YfS+fGjGl+QPCIs6+Dt1iwxsmQ0V5o+r1EBy87xED3ylcBg7mxA
	ayp8LWTb7Qx7dm7T3s8LAb9x9G1BsRrjKJBI1iXiMVzlEbfY4ft+Fx5nZBBU1c+OWzbjRtOOr+o
	RlMJweu990lFEehR2Ue2T/nxNjvwV6l9HWOGWF1eY1TIHpZOSXE1ntbZSbHTuE+ZAD+LFKvaA4+
	HP2aDWvQt8ext+ZKldjaCSw+d0l1FmCIoW78RekPMwtpM2u8CGFgr5e7btW2DIQqYs0iiYIHhDU
	rAMZIIyD8wPyrdBDqNHkuVn5k4DmFLetaQZfquOEgxj/VWbx1wTSYZSxxZ8SdazrajUWvG6bBs
X-Received: by 2002:a05:690e:11ce:b0:66e:61bc:142b with SMTP id 956f58d0204a3-66fb3f17e38mr338606d50.6.1788450227467;
        Thu, 03 Sep 2026 08:43:47 -0700 (PDT)
Received: from ?IPV6:2600:6c5c:6b00:316::23? ([2600:6c5c:6b00:316::23])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66fb48b374bsm157898d50.3.2026.09.03.08.43.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 08:43:46 -0700 (PDT)
Message-ID: <f233039c-e23e-40bf-b3ec-061f322d26af@gmail.com>
Date: Thu, 3 Sep 2026 11:43:45 -0400
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH iwl-next 6/8] e1000e: disable NAPI while interface is down
To: Simon Horman <horms@kernel.org>
Cc: intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
 anthony.l.nguyen@intel.com, przemyslaw.kitszel@intel.com,
 aleksander.lobakin@intel.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, corbet@lwn.net,
 skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260830232146.36948-7-tactii@gmail.com>
 <20260903102748.578986-1-horms@kernel.org>
Content-Language: en-US
From: Matt Vollrath <tactii@gmail.com>
In-Reply-To: <20260903102748.578986-1-horms@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/3/26 06:27, Simon Horman wrote:
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> Full review at: https://sashiko.dev/#/patchset/20260830232146.36948-2-tactii@gmail.com?part=6
> ---
> e1000e: disable NAPI while interface is down
> 
> This commit moves napi_disable into e1000e_down and adds napi_enable to
> e1000e_up to ensure NAPI is disabled during reconfiguration windows.
> 
>> diff --git a/drivers/net/ethernet/intel/e1000e/netdev.c b/drivers/net/ethernet/intel/e1000e/netdev.c
>> index 194166531bc84..6d846cacb026e 100644
>> --- a/drivers/net/ethernet/intel/e1000e/netdev.c
>> +++ b/drivers/net/ethernet/intel/e1000e/netdev.c
> [ ... ]
>> @@ -3601,7 +3603,7 @@ void e1000e_down(struct e1000_adapter *adapter, bool reset)
>>   
>>   	e1000_irq_disable(adapter);
>>   
>> -	napi_synchronize(&adapter->napi);
>> +	napi_disable(&adapter->napi);
> 
> [Severity: High]
> Does this change introduce an infinite hang in napi_disable() due to
> concurrent or duplicate e1000e_down() calls?
> 
> A runtime PM suspend callback (e1000e_pm_runtime_suspend) can execute
> concurrently with an ethtool operation like e1000_set_ringparam. The ethtool
> operation sets the __E1000_RESETTING bit and holds it while allocating
> resources.

No, ethtool and runtime PM suspend are synchronized:
* ethtool core calls pm_runtime_get_sync() before any operation. This
   increments dev->power.usage_count and waits for any ongoing suspend to
   finish.
* PM core rpm_suspend exits without retry (rpm_check_suspend_allowed()).

> 
> The PM suspend callback waits on this bit but uses a bounded timeout (300ms).
> If the ethtool operation takes longer than 300ms, the PM callback times out,
> prints a WARN_ON, and unconditionally calls e1000e_down():
> 
> e1000e_pm_runtime_suspend() {
>          while (test_bit(__E1000_RESETTING, &adapter->state) && count--)
>                  usleep_range(10000, 11000);
> 
>          WARN_ON(test_bit(__E1000_RESETTING, &adapter->state));
> 
>          /* Down the device without resetting the hardware */
>          e1000e_down(adapter, false);
> }
> 
> Because the ethtool operation also called (or is calling) e1000e_down(),
> napi_disable() is executed either concurrently or sequentially on an
> already-disabled NAPI struct, leading to an infinite hang waiting for
> NAPI_STATE_SCHED.
> 
> [Severity: High]
> Could this also lead to a sequential double napi_disable() hang due to state
> mismatches where e1000e_down() is called but netif_running() remains true?
> 
> The e1000e_pm_thaw() function attempts to bring the device back up after a
> freeze/suspend. If e1000_request_irq() fails, it exits via the err_irq label
> without calling e1000e_up(), leaving NAPI disabled:
> 
> e1000e_pm_thaw() {
>          rc = e1000_request_irq(adapter);
>          if (rc)
>                  goto err_irq;
> 
>          e1000e_up(adapter);
> }
> 
> However, the device's IFF_UP flag is untouched, so netif_running() remains
> true. Subsequently, if an administrator changes the MTU via
> e1000_change_mtu(), the driver checks netif_running() and blindly calls
> e1000e_down():
> 
> e1000_change_mtu() {
>          if (netif_running(netdev))
>                  e1000e_down(adapter, true);
> }

Core does not call ndo_change_mtu on detached devices, it checks
netif_device_present() in the typical path. Bonding and team paths will
close the device before changing MTU.

Same netif_device_present() check in ethtool core and e1000e_pm_freeze().

However, the PM runtime suspend and resume ops only check IFF_UP and not
netif_device_present(). PM core does not check this or gate it on a known
thaw failure (by design). That is a real pre-existing bug made more
consequential by this change.

> 
> This invokes napi_disable() a second time sequentially, which hangs
> indefinitely because the NAPI instance was never re-enabled.
> 
>>   
>>   	timer_delete_sync(&adapter->watchdog_timer);
>>   	timer_delete_sync(&adapter->phy_info_timer);

