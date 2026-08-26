Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC333B7754
	for <linux-doc@vger.kernel.org>; Wed, 26 Aug 2026 08:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787731770; cv=none; b=phPwtw8z5uay/UFWY/c1aSmw81ihaw94PFOKhsofOl6e+SmbrnYLNkFIT/fM0EqUT/mu8QO7I323MRLzDo3099WP+Svy4xZpzHtdedORifD0YyVURUTqD3oKadKe5r10JJE1pkdA1pafwh7JBFM3U7nmnbo4nj50CIhaoo3Pa+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787731770; c=relaxed/simple;
	bh=rEbNkFigjp0FGDCJsty0si0XKQ+e9anzsk0sFIsDhoU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KOu5iIdDNT3gKLIeTxUWeaBsm996+4M4laFgzrRiccHgeEmDcjH+MwH/v78fQl3YNUt1Q7nAnLdAICK0l/a7pmZDTkl+urIJh3xNxj3hk7bqpm/5Kxvphto5TfK2U6zbawutLvbWdC1MDYoajSEi4qjMOJUkqvmOL0g0wYooSLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YuQ1hN9N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EesU6/Ck; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YuQ1hN9N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EesU6/Ck"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q7Mx1E1261254
	for <linux-doc@vger.kernel.org>; Wed, 26 Aug 2026 08:09:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OJXQT0c6OYFN2aHcq1lc8qaGVj0md3a70HDIO/2Fy+0=; b=YuQ1hN9NkB+j/f2K
	jM4IdS4G+UxnMIRU84VU68/00IK/Or+kzo4uaBrPFYs+NqjhdZ3MONsOrl1mXxAV
	Dwj/k1yXeXte7091lspDKCgublXsw+jOBMltcaZFLiUxA+xJ9cghEBkD6925xiAw
	N01RVw4hEZlasO1juIDloEqq5SAL1aC0P2DqultRwCzLNHDq0UH+IKYpsxjfgT2L
	BHGYYkD58l2QL0GpcEDWFPz0giEt7t4wAXs23Ej/tn6kfPB2Y7Ngp+Volbb1PHl4
	bI0WpaxoBUjUO4+HrOIgYSZKTC9LERCexEGDfXVwjKm4JelbNEFSrSYxdjkaFRzM
	HmuAjg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9uq1r5yy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 26 Aug 2026 08:09:27 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52ee59064d2so236601cf.1
        for <linux-doc@vger.kernel.org>; Wed, 26 Aug 2026 01:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787731766; x=1788336566; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OJXQT0c6OYFN2aHcq1lc8qaGVj0md3a70HDIO/2Fy+0=;
        b=EesU6/CkhAShe5PRTIpIMtJ2EBGbKbyHgadTLRkeuz92p10et/KS2G4evShrQJ2ku3
         N5ZbmM4jlP03LgKr6fQs2HGhqg06lvPdERZI0MQGVb3XxFpVpKPxg5S/WkG5AkSvRl9v
         Pzq7BldSswNrmgs5QfVZoBCrR+HbdrbF6ApUvfr6UxyE83sW7QKd7DVNQwldCF5AwdL0
         gFVdNbram0CmziAySg0BJ49YCDIWtWKRDZSiFwP46vPZoG32d+Smu0zDMR5NBQtCjsct
         l2mYWM4saXam+j9LkjaTQIF8crimRdG26FrGnc39y5bxS257rJThH9yEIuuFFvz26QDg
         hMFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787731766; x=1788336566;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OJXQT0c6OYFN2aHcq1lc8qaGVj0md3a70HDIO/2Fy+0=;
        b=JWUd8yT/K4jMPmfxQyn5384HYMEtVHoWHCLpJk6FkCBeBoOHnyRqkXUH7aCA/W74+l
         frucrEX2zChWCYFJdDjTnuOK/kIsriiRlXBD/klPIXg+LnE6sdB4AV7ZxiTt23fuT7uh
         0QFhU+X2wjue9a+xYTU2umH3o1c0MthiKmxD1JDWLC4XSvJn5vUhC7umiDumIIJFW2v8
         yFl+yyB80IVj25cxzCPK5Gf2ovrha+ZAO383VBM9nn+JnzPiRMt8+CXNXNz5kIqKL+X+
         fPEUdqtcoJ5q8gXDRJMS5z5Dd3/AYVzm57MdqBMCBp2gkC9khF1ohLbKvRW82tX9QKQY
         BeFA==
X-Forwarded-Encrypted: i=1; AHgh+Rp7NPqrb51Krc5dNCDqVjaiRY3wnmEX52JRI41RXE7IWmj9u2ah1AvKukNQKof3GVRCAws2GE/uHFc=@vger.kernel.org
X-Gm-Message-State: AFuF++l1Ke+CTJcxtOSybiidWoJSE9mxw8otJi10wZ1vdp1l9a8ME5B+
	pmNpqsHBJWQzB72EI2qHM4ZpohtiqTnkciIqSgpK59ANnh1SBCOdcHlKtamGns3kD6DzEITi7Fc
	t2Jna4Uf/twEHwn4GTgv5bJ7LRWnnYOAfUOa0MboKi5PhPel9PtMxITB5CApCkY0=
X-Gm-Gg: AR+sD12kDkKRNceHWdy+b4+bxLDx06OtKGH1u7/lUkUzBLPlTWao4HqLwXu1neS7q7N
	LvxtqNPTg0LJi+QTb6sjJ0zYobm+GAJiABwpFQhgsqjMrF6wul5+NUGayqcXJNUizwtiLMqitOH
	WMBSwim3YsWmk/ciJDYy0gzZgI2MTb1SnVr01t/azOVfXbYRuNVmVpZ6KTgXdTZhpK+Mf19uy/9
	RTjKcpR9LMcw+NwIGod52qwei7V4dtBHgpvchS5xG3ChBjLGisGmooiRfY+1/Bpdn+5i5dVSXMX
	j2CJ54EZp8aUjta0Y8BHpVtrhrhjyufIXTq8/9Q9fhH1NmGY+tbS0114BLSE1OOQP0F6sW9erA+
	QcjkkSCnbtUm/v9tyWp2yzIMBWg3L
X-Received: by 2002:a05:622a:cc:b0:516:82e2:7788 with SMTP id d75a77b69052e-52e2ec1e3c5mr116721601cf.1.1787731766322;
        Wed, 26 Aug 2026 01:09:26 -0700 (PDT)
X-Received: by 2002:a05:622a:cc:b0:516:82e2:7788 with SMTP id d75a77b69052e-52e2ec1e3c5mr116721221cf.1.1787731765865;
        Wed, 26 Aug 2026 01:09:25 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:dfd4:a0a3:2df2:7724])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dc96bff9sm18773245e9.5.2026.08.26.01.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 01:09:24 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Alessio Belle <alessio.belle@imgtec.com>,
        Luigi Santivetti <luigi.santivetti@imgtec.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jeff Johnson <jjohnson@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Chen-Yu Tsai <wens@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-pm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, imagination@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-pci@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: Re: [PATCH v3] power: sequencing: rename pwrseq_power_on/off() to pwrseq_enable/disable()
Date: Wed, 26 Aug 2026 10:09:22 +0200
Message-ID: <178773176015.26343.5524450275043262993.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260731-pwrseq-vote-rename-v3-1-44e60b8be053@oss.qualcomm.com>
References: <20260731-pwrseq-vote-rename-v3-1-44e60b8be053@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: fKWxDAkOWqNeP1agK2BYNgZeIDZS3ZI8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA2NiBTYWx0ZWRfX/jwMQ3QF5fkY
 pMi1ujf0KMJFN1Ldgh9a4VvSR6nEWh9tmyNS6RUsLGZQ3w7RFUmzM0ZG7CcM8pq3iePfAtbwMNU
 5h7/besxxVk8+q1GQBuW86zKULAc9UTC00zM1LhrmOgSd6DvS2Alhckp7Y8wfNvl+gGeN7dqy+V
 kJNIUEOcdUGT5vTRnEnlyWHALnfbKHZo+U1Fg0Ngn63riByVmBaOzIzLqQ9UGRHASs6B7OkWA/o
 1G6jtgSgzkIu7WLg6eL3u55sgaxYyUTGRKj1n4sIAL00U7gq27X1GhdDJ0PE1qsUPQkYDqGvO9r
 +UsWGksFkX6m4HQx9frSvRqhmfE9IIbosz4ngLPXFQMyhLj+HShpVW38yXojkwXA6vCO3OPzs0Y
 dVzGuR9YRxMWPkimELpt7/VQrn7zv+2/aw/MTGSaGfi+8Ui+rlX2Q2X7nZgO3RnSiXqZ1moZ6qK
 rK8u1fD71N6uT/kWqAA==
X-Authority-Analysis: v=2.4 cv=Y77IdBeN c=1 sm=1 tr=0 ts=6a8e9f37 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=_EivlD1RsPJwtJxW0JgA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: fKWxDAkOWqNeP1agK2BYNgZeIDZS3ZI8
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA2NiBTYWx0ZWRfX8IrnnbE/4/or
 MIQdj0Msbm5LfhFNChktfqJbnA0dPeB1Br/bZ0g13QHP7rhtrkJz7K75zlBh6Frq0HpzXl0vxFr
 0wHlWDXtT/ieb1IK2c5Uiu2/P3pw9pg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260066


On Fri, 31 Jul 2026 15:42:18 +0200, Bartosz Golaszewski wrote:
> The way power sequencing works means that a call to pwrseq_power_on()
> does not necessarily result in the pwrseq target being powered-on at
> that time: it may have already been powered on before. Similarly: a call
> to pwrseq_power_off() does not have to result in an actual powering off
> of resources: there may still be other users that requested a power-on
> before.
> 
> [...]

Applied, thanks!

[1/1] power: sequencing: rename pwrseq_power_on/off() to pwrseq_enable/disable()
      https://git.kernel.org/brgl/c/d51fc9d4cd6eb18ac82913d83ecf7bd8c85f71ee

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
