Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7FA36728C
	for <linux-doc@vger.kernel.org>; Wed, 27 May 2026 15:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779896721; cv=none; b=Evdlo3q/mY6sjPp21iYi9k1sIv3Pe4HYTLvc53v7fMV66qkBT/DX8+t91oTmnJFcBjbjS68QwPXHM72+/HEaQdTqKxhaLE4GvVG1pBDSHOqc9Oyuv9jMC1lr34aaEjgSWix3TFG8vcsDKt9/zINI6sIpUy6rmgCPX1KkR0feuHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779896721; c=relaxed/simple;
	bh=UyFTo/w2M+a3Jns1IeE99BbPeqspH1jAjfYFH0sjf30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EomMTdVar555UoMsdU8v2ShAtPZBzRpHdlf85TPIFbM6UZag0pOs9T9jAGD2It/Q7HEqQ3AD9MqpN9U/3Nb0/tEDKWXO+PCJv9vrx6MwZkuKmdeXwNSQBDRyLV1CXusWYhaEvgmaKtgBezq3EzwxwelH8UziWThyRF8lRXE/MXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f+rfGcjE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SljQj2iz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f+rfGcjE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SljQj2iz"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64RC4un61477922
	for <linux-doc@vger.kernel.org>; Wed, 27 May 2026 15:45:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/CAOuwABW/NK0zT7PazBOrFx
	nm1aaFtR/UaMUOazE7M=; b=f+rfGcjE/MvH8t9xNntcx8C7P7IfG8DTuuzgOCkH
	I03Q5Zuf9XBmluzJN21mXjtcHKeV4X/vCJ4vtrVNrWGyM4cRmgh9TaiCWe8k12wo
	Nd5MgZXlVqSNdPFv4JsuNagnvvFVzQ/E/rvrUi4DBIjTmxcypxpNYzh58HzrBIYM
	fmEOpQLZrSu539xc6h04TM3o1gCIynTdm9VIDMhsVF+IDHUKfSGyI742Cz/NuXdn
	35oMa9wu0ZiBanVUadE7rybAeSH11Zk0syW1sSSnqG4nnn5YJ4MI2lOrQN+kJysD
	9ly/U640HIBbNkuJK5lHjNMZs5hcVZAIZO+Xx9ikyEEp6g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee0a88uvw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 27 May 2026 15:45:19 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30457ff05b8so4751694eec.0
        for <linux-doc@vger.kernel.org>; Wed, 27 May 2026 08:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779896718; x=1780501518; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/CAOuwABW/NK0zT7PazBOrFxnm1aaFtR/UaMUOazE7M=;
        b=SljQj2izyTaBNEiumgCOrIHoK5WSnK3JLVjvChwrwnd5VqVX7WehpIbqmJw9BCTHL4
         j/DtUigHlJv5b+apa3YPZvQ4lnEspDxOA5jdfnRR+ejtB9Q+3HNnDV1HpLWQgKW9tC/D
         OawLVf+Ic0anSJpUvE0cjkgIfgq9AF50mFE6vus4khElhFoWbbqER5vNgRJUcL7pc1Ay
         zZwxHJZ6g9fCAYZBaGtt3JrXGjfJCQ14YScdbM9VflzUgewrivrvgRQzkLualu1zPGD2
         E0lCQ2qChNw8yUY5xAfwPpfPTiNhLsDrjrLshLldzL7Kc+44TqxzLL7jMkTB6TuPjOgh
         6T7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779896718; x=1780501518;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/CAOuwABW/NK0zT7PazBOrFxnm1aaFtR/UaMUOazE7M=;
        b=fJaeoM95c8TW6O/gFqN0UePfl1tGj9djE52fYOdHkwE2Zl3uF+Svi8VtwESBDh2wox
         IgzuOpbx6MQ5Rvoo1jQnZ+TBqUph0RpFazFORO04FDb75Cax9rg5xUbzPfajTweT7APW
         OcDBlaI4rdRFEwau1QcOhwH5l59g3wsk4DDv7vnRYJbR41FzeWNR8stTlzwLpPf1PYyt
         m41Skrg0iSVrbW5UHMcWtZQUTf5CSuek1Pb8EMvrK2mA6kgp8ag+HBxxT2B2C/9yPcMq
         i5r1qdl+ay8I9kIiwf4O0vpaD7aWAZYIS7HmLV4xWtWzhI4hoD65EG0yc7CFhFqI18Pi
         BmxQ==
X-Forwarded-Encrypted: i=1; AFNElJ+whmuyPB2Zx3svTdTPeSlxl+kVApYZTmnQ+15KQm2hXu9Ur0MYSlvY4z0TGmnmB9z8x0swtxkjYaA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVCM8dDuJYPyZ+utukDrrlpUW6Rp90iE0Mr6thuvyTHSvBt9El
	m/Wn2+qkDUW3gYdcaaA95ncDWDYUSsbhPLWibHJT5PEs2bwfAYXNv+BMlEx5eewTA6GKoEPIofa
	CQKMd8WT9Vosdfv6sXxyiCsgteF2NxyzIB/fdOHhJv2HBVkIaZVEZWmV6wckqjoI=
X-Gm-Gg: Acq92OHQ6PATmSItVYLWmpArbpbBUGPdMpJWV234+0arXS29ggDHO61/CxYq2VXJeMf
	FiW/qmwdzKWNA0KsFw6UVhkwTN4dC7ZxEp24Tl1/dG3G0HJJJvIS9k8jmW5pkvHF+Djck291g42
	2puUAnBPbpsq2kjm4SValJMsbVj9LVsjv/MbNJQ0AKRT1NFzhrZJFa0OcatHjiwrBesQMEYBS6p
	DYSU/4khTc/t2wN0oFphcxdVhReBT3fAgZd41HtUL/ZfYxQqwtx0Yi4HE3xccl0j2v33AS2MLOr
	Fjm4xiIBeRhD3mUZ94wWB5MQY840sPEmKHXskzQGIEnazy5Z2bBtk+9uyJb3Y0oeDqncUXV985s
	YQYfv07zBZ7sWMRRw0Y+HKD6egT0LM3I=
X-Received: by 2002:a05:693c:65c7:b0:304:562c:2338 with SMTP id 5a478bee46e88-304562c3085mr5987637eec.14.1779896717834;
        Wed, 27 May 2026 08:45:17 -0700 (PDT)
X-Received: by 2002:a05:693c:65c7:b0:304:562c:2338 with SMTP id 5a478bee46e88-304562c3085mr5987616eec.14.1779896717248;
        Wed, 27 May 2026 08:45:17 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30451ef4af0sm13044572eec.3.2026.05.27.08.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 08:45:16 -0700 (PDT)
Date: Wed, 27 May 2026 10:45:15 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Guodong Xu <guodong@riscstar.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>,
        Atish Patra <atish.patra@linux.dev>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Deepak Gupta <debug@rivosinc.com>, Zong Li <zong.li@sifive.com>,
        Christian Brauner <brauner@kernel.org>,
        Charlie Jenkins <charlie@rivosinc.com>,
        Samuel Holland <samuel.holland@sifive.com>, linux-doc@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, kvm@vger.kernel.org,
        kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v2 02/10] riscv: hwprobe.rst: Replace tabs with spaces
Message-ID: <4otlnil7qj53dzlbvu2wd3gvzzgs5cszo3merkcb2qbbiudw5n@4i2k47coybf4>
References: <20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc@riscstar.com>
 <20260511-rva23u64-hwprobe-v2-v2-2-21c5a544f1dc@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511-rva23u64-hwprobe-v2-v2-2-21c5a544f1dc@riscstar.com>
X-Authority-Analysis: v=2.4 cv=XrrK/1F9 c=1 sm=1 tr=0 ts=6a17118f cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ee_2aqc6AAAA:8 a=p7TuRdreTiM3c_8AigcA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-GUID: bEdNJwBscw32yJWjWZ0wOCP6rK9E51Ej
X-Proofpoint-ORIG-GUID: bEdNJwBscw32yJWjWZ0wOCP6rK9E51Ej
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDE1NyBTYWx0ZWRfX7LK1YU1EoLaq
 mz2RmeCpvodIeRNatSqh7C2lvmEf7E1HuGhMqvQNBLUjIks3jevR4KvB3n/UpbKfcXLJB0WceWb
 mKgR3n07J01piwKgCPLhpdwbviVUPsbO5T6YAX4U0Pn+F2DqLLjRV8rqNOkDMaSU94hU35C003q
 QGXdqCII01I4du1/WsXsIZ5dGB4Mgy63S0kjnk3MyfQqrGuW3GKAMzbSHl0u9oMn6lW0FaR5u8X
 4LFBYSvpevU9VvuOoNqkb6q7cwxNmcJ9YOpw0FcOK+Ao41vqp6E4ikGd2ptaJdsiM1j0XOVzVMU
 ZCEMyGZccf0Jc2tszVTLgAU4BJfLI3yYHL91TyV6Bo+sKp9oCek8q4qtS9pWZutXf/E3D+Gi4j6
 nYm6BefyeM4H2qdyp3gx/9V6yAVNwBd5ZrBsr017MHuva4mFA19IA9R/6VXILuDOSFSbn+QN36l
 Pi6ZTVAlXqoOKbeiMkA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_02,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270157

On Mon, May 11, 2026 at 09:34:47PM -0400, Guodong Xu wrote:
> From: Andrew Jones <andrew.jones@oss.qualcomm.com>
> 
> A handful of vendor-extension entries indent continuation lines with a
> tab character, while the rest of hwprobe.rst uses spaces. Replace
> those tabs with spaces so the file is consistently space-indented.
> 
> Cosmetic update, no functional change.
> 
> Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
> v2: No change.
> ---
>  Documentation/arch/riscv/hwprobe.rst | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

We could just move this patch to the beginning of the series and also use
it to make all indentation consistent in order to fix the consistency
issue I pointed out in the last patch.

Thanks,
drew
